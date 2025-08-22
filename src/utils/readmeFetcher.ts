import type { Project } from "@/types/project";
import M_ from "markdown-it";
import { ref } from "vue";

// Simple cache for README data
export const readmeCache = ref<
  Record<string, { html: string; error: string; loaded: boolean }>
>({});

// Simple cache for failed attempts
export const failedCache = ref<Set<string>>(new Set());

// Single markdown-it instance
const markdownIt = new M_({
  html: true,
  linkify: true,
  typographer: true,
});

// Helper function to add delay between requests
const delay = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

// Check if it's a complex repo pattern
const isComplexPattern = (repositoryUrl: string): boolean => {
  const complexPatterns = [
    /\/tree\//,
    /\/blob\//,
    /\/packages\//,
    /\/pkgs\//,
    /\/lib\//,
    /\/src\//,
  ];
  return complexPatterns.some((pattern) => pattern.test(repositoryUrl));
};

// Simple function to fetch README from GitHub repository
export const fetchReadme = async (project: Project, useCache = true) => {
  if (!project.repository) {
    const error = "No repository URL available";
    return { html: "", error, loaded: true };
  }

  // Check cache first
  if (useCache && readmeCache.value[project.id]) {
    return readmeCache.value[project.id];
  }

  try {
    // Extract GitHub owner/repo from repository URL
    const githubMatch = project.repository.match(
      /github\.com\/([^\/]+)\/([^\/]+)/
    );
    if (!githubMatch) {
      const error = "Unable to extract GitHub repository information";
      readmeCache.value[project.id] = { html: "", error, loaded: true };
      return readmeCache.value[project.id];
    }

    const [, owner, repo] = githubMatch;
    const cacheKey = `${owner}/${repo}`;

    // Check if we already know this repo failed
    if (failedCache.value.has(cacheKey)) {
      const error = "README not found in repository (cached failure)";
      readmeCache.value[project.id] = { html: "", error, loaded: true };
      return readmeCache.value[project.id];
    }

    // Detect if this is a complex repository structure
    const isComplex = isComplexPattern(project.repository);

    if (isComplex) {
      // For complex repos: use the exact pattern provided
      const rawUrl = `https://raw.githubusercontent.com/${owner}/${repo}/refs/heads/main/pkgs/${project.id}/README.md`;

      try {
        const response = await fetch(rawUrl);
        if (response.ok) {
          const content = await response.text();
          const html = markdownIt.render(content);

          // Cache successful result
          readmeCache.value[project.id] = { html, error: "", loaded: true };
          return readmeCache.value[project.id];
        }
      } catch (error) {
        // Cache failed attempt
        failedCache.value.add(cacheKey);
        const errorMsg = "Failed to fetch README from complex repository";
        readmeCache.value[project.id] = {
          html: "",
          error: errorMsg,
          loaded: true,
        };
        return readmeCache.value[project.id];
      }
    } else {
      // For simple repos: use GitHub API
      const branches = ["main", "master"];
      const fileNames = ["README.md", "readme.md"];

      // Try each branch and filename sequentially (no parallel requests)
      for (const branch of branches) {
        for (const fileName of fileNames) {
          const apiUrl = `https://api.github.com/repos/${owner}/${repo}/contents/${fileName}?ref=${branch}`;

          // Skip if already failed
          if (failedCache.value.has(apiUrl)) {
            continue;
          }

          try {
            const response = await fetch(apiUrl, {
              headers: {
                Accept: "application/vnd.github.v3.raw",
                "User-Agent": "xsoulspace.dev-readme-fetcher",
              },
            });

            if (response.status === 403 || response.status === 429) {
              // Rate limited - cache and stop
              failedCache.value.add(apiUrl);
              failedCache.value.add(cacheKey);
              const error = "Rate limited - please try again later";
              readmeCache.value[project.id] = { html: "", error, loaded: true };
              return readmeCache.value[project.id];
            }

            if (response.ok) {
              const content = await response.text();
              const html = markdownIt.render(content);

              // Cache successful result
              readmeCache.value[project.id] = { html, error: "", loaded: true };
              return readmeCache.value[project.id];
            }

            // Cache failed URL
            failedCache.value.add(apiUrl);
          } catch (error) {
            failedCache.value.add(apiUrl);
          }

          // Small delay between requests to be respectful
          await delay(500);
        }
      }
    }

    // All attempts failed
    failedCache.value.add(cacheKey);
    const error = "README not found in repository";
    readmeCache.value[project.id] = { html: "", error, loaded: true };
    return readmeCache.value[project.id];
  } catch (error) {
    console.error("Error fetching README:", error);
    const errorMsg = "Failed to fetch README from repository";
    readmeCache.value[project.id] = { html: "", error: errorMsg, loaded: true };
    return readmeCache.value[project.id];
  }
};

// Helper function to clear caches (useful for debugging or memory management)
export const clearReadmeCaches = () => {
  readmeCache.value = {};
  failedCache.value.clear();
};
