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

  // Pub.dev link for Dart packages
  if (project.tags.includes("dart") || project.tags.includes("flutter")) {
    const packageName = project.title.toLowerCase().replace(/_/g, "-");
    links.push({
      type: "pub",
      url: `https://pub.dev/packages/${packageName}`,
      icon: "pub",
      label: "Pub.dev",
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
