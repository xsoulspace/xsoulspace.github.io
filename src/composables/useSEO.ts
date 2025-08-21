import { useHead } from '@vueuse/head';

export function useSEO(meta: {
  title: string;
  description: string;
  image?: string;
  url?: string;
}) {
  useHead({
    title: meta.title,
    meta: [
      { name: 'description', content: meta.description },
      { property: 'og:title', content: meta.title },
      { property: 'og:description', content: meta.description },
      { property: 'og:type', content: 'website' },
      {
        property: 'og:url',
        content: meta.url || (typeof window !== 'undefined' ? window.location.href : ''),
      },
      { property: 'og:image', content: meta.image },
      { name: 'twitter:card', content: 'summary_large_image' },
      { name: 'twitter:title', content: meta.title },
      { name: 'twitter:description', content: meta.description },
      { name: 'twitter:image', content: meta.image },
    ],
    link: [
      {
        rel: 'canonical',
        href: meta.url || (typeof window !== 'undefined' ? window.location.href : ''),
      },
    ],
  });
}
