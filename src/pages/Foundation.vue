<template>
  <div class="foundation-page">
    <div class="packages-list">
      <!-- Package list will go here -->
    </div>
    <div class="code-view">
      <!-- Code examples will go here -->
    </div>
  </div>
</template>

<style scoped>
.foundation-page {
  display: grid;
  grid-template-columns: 300px 1fr;
  min-height: 100vh;
}

.packages-list {
  border-right: 1px solid var(--color-border);
  padding: var(--spacing-lg);
}

.code-view {
  padding: var(--spacing-lg);
}
</style>
