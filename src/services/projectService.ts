import type { Project } from "@/types/project";
import yaml from "yaml";

// Cache for parsed project data
const projectCache = new Map<string, Project[]>();

// A type guard to check if the module has a default export
function hasDefault<T>(module: any): module is { default: T } {
  return module && typeof module === "object" && "default" in module;
}

export async function getProjects(
  category: string,
  locale: string = "en"
): Promise<Project[]> {
  const cacheKey = `${locale}-${category}`;

  // Check cache first
  if (projectCache.has(cacheKey)) {
    return projectCache.get(cacheKey)!;
  }

  try {
    const yamlModule = await import(`../data/${locale}/${category}.yaml?raw`);

    let projects: Project[];

    if (hasDefault<string>(yamlModule)) {
      projects = yaml.parse(yamlModule.default) as Project[];
    } else if (typeof yamlModule === "string") {
      projects = yaml.parse(yamlModule) as Project[];
    } else {
      console.error(
        "Could not find YAML content in the imported module.",
        yamlModule
      );
      return [];
    }

    // Cache the parsed data
    projectCache.set(cacheKey, projects);
    return projects;
  } catch (error) {
    console.error(
      `Error loading or parsing project data for '${category}' in '${locale}':`,
      error
    );
    return [];
  }
}

// Clear cache when needed (e.g., on locale change)
export function clearProjectCache() {
  projectCache.clear();
}
