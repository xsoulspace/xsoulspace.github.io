<template>
  <footer class="app-footer" role="contentinfo">
    <div class="footer-content">
      <div class="footer-info">
        <span>xsoulspace.dev</span>
        <span>{{ t('footer.designedBy') }}</span>
      </div>
      <div class="footer-description">
        <p>{{ t('footer.companyDescription') }}</p>
      </div>
      <div class="footer-links">
        <a href="https://github.com/xsoulspace" target="_blank" rel="noopener noreferrer">GitHub</a>
        <span>{{ t('footer.copyright') }}</span>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { useLocale } from '../../locales';

const { t } = useLocale();
</script>

<style scoped>
.app-footer {
  padding: var(--spacing-xl) var(--spacing-lg);
  background-color: var(--color-surface);
  border-top: 1px solid var(--color-border);
  color: var(--color-text-secondary);
  font-size: 0.9rem;
}

.footer-content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  gap: var(--spacing-lg);
  max-width: 1200px;
  margin: 0 auto;
}

.footer-info,
.footer-links {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-sm);
}

.footer-description {
  flex-basis: 100%;
  max-width: 600px;
  text-align: center;
}

@media (min-width: 768px) {
  .footer-description {
    flex-basis: auto;
  }
}
</style>
