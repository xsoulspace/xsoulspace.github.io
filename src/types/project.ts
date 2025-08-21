export interface ProjectLink {
  title: string;
  url: string;
}

export interface Project {
  id: string;
  title: string;
  subtitle?: string;
  description: string;
  repository?: string;
  tags: string[];
  media: {
    type: "image" | "video";
    url: string;
  };
  links?: ProjectLink[];
  codeSample?: {
    language: string;
    code: string;
  };
  bentoConfig?: {
    size: "small" | "medium" | "large";
    accent: string;
  };
}
