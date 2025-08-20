import yaml from 'yaml';
import projectsYaml from '@/data/projects.yaml?raw';
import type { ProjectGroup } from '@/types/project';

export function getProjectGroups(): ProjectGroup {
  const data = yaml.parse(projectsYaml);
  return data.project_groups;
}
