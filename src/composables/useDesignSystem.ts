import { computed } from 'vue';

export const designGuide = {
  colors: {
    background: '#FAF6F0', // Unglazed Bisque
    text: '#4E342E', // Earthy Brown
    primary: '#E07A5F', // Terracotta
    secondary: '#81B29A', // Sage Glaze
    highlight: '#F2CC8F', // Sandstone
    // Add other colors as needed
    surface: '#F7F2E9',
    border: '#DCD3C5',
    textSecondary: '#795548',
  },
  typography: {
    fontFamily: `'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`,
    headingSizes: {
      h1: '3rem',
      h2: '2.25rem',
      h3: '1.5rem',
      h4: '1.25rem',
    },
    bodySize: '1rem',
  },
  spacing: {
    xs: '0.25rem',
    sm: '0.5rem',
    md: '1rem',
    lg: '1.5rem',
    xl: '2.5rem',
    xxl: '4rem',
  },
  breakpoints: {
    mobile: '640px',
    tablet: '768px',
    desktop: '1024px',
  },
  borderRadius: {
    sm: '4px',
    md: '8px',
    lg: '16px',
  },
  shadows: {
    sm: '0 2px 4px rgba(0,0,0,0.05)',
    md: '0 4px 8px rgba(0,0,0,0.1)',
  }
};

export function useDesignSystem() {
  const cssVars = computed(() => ({
    '--color-background': designGuide.colors.background,
    '--color-text': designGuide.colors.text,
    '--color-primary': designGuide.colors.primary,
    '--color-secondary': designGuide.colors.secondary,
    '--color-highlight': designGuide.colors.highlight,
    '--color-surface': designGuide.colors.surface,
    '--color-border': designGuide.colors.border,
    '--color-text-secondary': designGuide.colors.textSecondary,

    '--font-family': designGuide.typography.fontFamily,
    '--font-size-h1': designGuide.typography.headingSizes.h1,
    '--font-size-h2': designGuide.typography.headingSizes.h2,
    '--font-size-h3': designGuide.typography.headingSizes.h3,
    '--font-size-h4': designGuide.typography.headingSizes.h4,
    '--font-size-body': designGuide.typography.bodySize,

    '--spacing-xs': designGuide.spacing.xs,
    '--spacing-sm': designGuide.spacing.sm,
    '--spacing-md': designGuide.spacing.md,
    '--spacing-lg': designGuide.spacing.lg,
    '--spacing-xl': designGuide.spacing.xl,
    '--spacing-xxl': designGuide.spacing.xxl,

    '--border-radius-sm': designGuide.borderRadius.sm,
    '--border-radius-md': designGuide.borderRadius.md,
    '--border-radius-lg': designGuide.borderRadius.lg,

    '--shadow-sm': designGuide.shadows.sm,
    '--shadow-md': designGuide.shadows.md,

    '--breakpoint-mobile': designGuide.breakpoints.mobile,
    '--breakpoint-tablet': designGuide.breakpoints.tablet,
    '--breakpoint-desktop': designGuide.breakpoints.desktop,
  }));

  return { cssVars, designGuide };
}
