import type { Project } from "@/types/project";

export function getPackageLinks(project: Project) {
  const links: { type: string; url: string; icon: string; label: string }[] =
    [];

  // GitHub link (if repository exists)
  if (project.repository) {
    links.push({
      type: "github",
      url: project.repository,
      icon: "github",
      label: "GitHub",
    });
  }

  // Add all custom links with appropriate icons
  if (project.links) {
    project.links.forEach((link) => {
      // Determine icon based on URL
      let icon = "external-link";
      if (link.url.includes("github.com")) icon = "github";
      else if (link.url.includes("pub.dev")) icon = "pub";
      else if (link.url.includes("npmjs.com") || link.url.includes("npm.com")) icon = "npm";

      links.push({
        type: icon,
        url: link.url,
        icon: icon,
        label: link.title,
      });
    });
  }

  // NPM link for NPM packages
  if (
    project.tags.includes("npm") ||
    project.tags.includes("javascript") ||
    project.tags.includes("typescript")
  ) {
    const packageName = project.title.toLowerCase().replace(/_/g, "-");
    links.push({
      type: "npm",
      url: `https://www.npmjs.com/package/${packageName}`,
      icon: "npm",
      label: "NPM",
    });
  }

  return links;
}
