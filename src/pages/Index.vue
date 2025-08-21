<template>
  <home-navigation />
</template>

<script setup lang="ts">
import HomeNavigation from '../components/sections/HomeNavigation.vue';
import { useSEO } from '../composables/useSEO';
import { useLocale } from '../locales';

const { t } = useLocale();

useSEO({
  title: 'xsoulspace.dev',
  description: t('footer.companyDescription'),
});
</script>
