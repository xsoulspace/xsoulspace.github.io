import type { Project } from "@/types/project";
import yaml from "yaml";

// A type guard to check if the module has a default export
function hasDefault<T>(module: any): module is { default: T } {
  return module && typeof module === "object" && "default" in module;
}

export async function getProjects(
  category: string,
  locale: string = "en"
): Promise<Project[]> {
  try {
    const yamlModule = await import(`../data/${locale}/${category}.yaml?raw`);

    if (hasDefault<string>(yamlModule)) {
      const projects = yaml.parse(yamlModule.default);
      return projects as Project[];
    }
    // Fallback for non-default exports if necessary, though `?raw` should be consistent.
    if (typeof yamlModule === "string") {
      const projects = yaml.parse(yamlModule);
      return projects as Project[];
    }

    console.error(
      "Could not find YAML content in the imported module.",
      yamlModule
    );
    return [];
  } catch (error) {
    console.error(
      `Error loading or parsing project data for '${category}' in '${locale}':`,
      error
    );
    return [];
  }
}
