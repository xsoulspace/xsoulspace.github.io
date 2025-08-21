<template>
  <project-showcase-page :title="t('nav.utilities')" :items="utilities" />
</template>

<script setup lang="ts">
import { useLocale } from '../locales';
import { utilities } from '../data/utilities';
import ProjectShowcasePage from './ProjectShowcasePage.vue';
import { useSEO } from '../composables/useSEO';

const { t } = useLocale();

useSEO({ title: t('nav.utilities'), description: 'Utilities by xsoulspace.dev' });
</script>