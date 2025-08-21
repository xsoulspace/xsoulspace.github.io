export interface ProjectLink {
  type: 'website' | 'apple_store' | 'google_play' | 'snap_store';
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
    type: 'image' | 'video';
    url: string;
  };
  links?: ProjectLink[];
}
