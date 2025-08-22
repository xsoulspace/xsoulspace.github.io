export interface NavigationItem {
  key: string;
  path: string;
  icon: string;
}

export interface Language {
  code: string;
  name: string;
}

export interface DropdownProps {
  trigger?: "click" | "hover";
  placement?: "bottom-start" | "bottom-end" | "top-start" | "top-end";
  offset?: number;
  width?: string;
  maxWidth?: string;
  minWidth?: string;
}

export interface DropdownItemProps {
  icon?: string;
  selected?: boolean;
  disabled?: boolean;
  variant?: "default" | "selected" | "danger";
}

export interface DropdownSectionProps {
  title?: string;
  padding?: string;
}
