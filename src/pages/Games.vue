<template>
  <project-showcase-page :title="t('nav.games')" :items="games" />
</template>

<script setup lang="ts">
import { useLocale } from '../locales';
import { games } from '../data/games';
import ProjectShowcasePage from './ProjectShowcasePage.vue';
import { useSEO } from '../composables/useSEO';

const { t } = useLocale();

useSEO({ title: t('nav.games'), description: 'Games by xsoulspace.dev' });
</script>