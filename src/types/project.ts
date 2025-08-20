export interface Project {
  id: string;
  title: string;
  subtitle?: string;
  type: string;
  description: string;
  repository?: string;
  tags?: string[];
  colSpan: number;
  rowSpan: number;
}

export interface ProjectGroup {
  [key: string]: Project[];
}
