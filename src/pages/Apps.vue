<template>
  <project-showcase-page :title="t('nav.apps')" :items="apps" />
</template>

<script setup lang="ts">
import { useLocale } from '../locales';
import { apps } from '../data/apps';
import ProjectShowcasePage from './ProjectShowcasePage.vue';
import { useSEO } from '../composables/useSEO';

const { t } = useLocale();

useSEO({ title: t('nav.apps'), description: 'Applications by xsoulspace.dev' });
</script>