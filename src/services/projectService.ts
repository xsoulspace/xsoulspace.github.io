import type { Project } from "@/types/project";
import yaml from "yaml";

// Import project images
import dailyBudgetPlannerPromo from "@/assets/project_images/daily_budget_planner/desktop_promo.webp";
import flutterCliUiGif from "@/assets/project_images/flutter_cli_ui/upgrading_packages.gif";
import lastAnswerImage from "@/assets/project_images/last_answer/macbook_1.png";

// Asset mapping for project images
const assetMap: Record<string, string> = {
  "/src/assets/project_images/daily_budget_planner/desktop_promo.webp":
    dailyBudgetPlannerPromo,
  "/src/assets/project_images/flutter_cli_ui/upgrading_packages.gif":
    flutterCliUiGif,
  "/src/assets/project_images/last_answer/macbook_1.png": lastAnswerImage,
};

// Cache for parsed project data
const projectCache = new Map<string, Project[]>();

// A type guard to check if the module has a default export
function hasDefault<T>(module: any): module is { default: T } {
  return module && typeof module === "object" && "default" in module;
}

// Function to resolve asset URLs in project data
function resolveAssetUrls(projects: Project[]): Project[] {
  return projects.map((project) => {
    if (project.media && project.media.url && assetMap[project.media.url]) {
      return {
        ...project,
        media: {
          ...project.media,
          url: assetMap[project.media.url],
        },
      };
    }
    return project;
  });
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

    // Resolve asset URLs with imported assets
    const resolvedProjects = resolveAssetUrls(projects);

    // Cache the parsed data
    projectCache.set(cacheKey, resolvedProjects);
    return resolvedProjects;
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
