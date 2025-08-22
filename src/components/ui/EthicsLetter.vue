<script setup lang="ts">
defineProps<{
  content: string;
}>();
</script>

<template>
  <div class="ethics-letter-container">
    <div class="letter-backdrop">
      <div class="letter-paper">
        <div class="letter-content">
          <div class="letter-header">
            <div class="header-line"></div>
            <h2 class="letter-title">Personal Philosophy</h2>
            <div class="header-line"></div>
          </div>

          <div class="letter-body" v-html="content"></div>

          <div class="letter-signature">
            <div class="signature-line"></div>
            <div class="signature-info">
              <p class="signature-name">Anton Malofeev</p>
              <p class="signature-alias">(Arenukvern)</p>
              <p class="signature-role">Founder & Creator</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.ethics-letter-container {
  position: relative;
  max-width: 900px;
  margin: var(--spacing-xxl) auto;
  padding: var(--spacing-xl);
  min-height: 600px;
}

.letter-backdrop {
  position: relative;
  perspective: 1000px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.letter-paper {
  position: relative;
  width: 100%;
  max-width: 700px;
  background: var(--color-surface);
  border-radius: var(--border-radius-md);
  padding: var(--spacing-xxl);
  margin: var(--spacing-xl) 0;
  border: 1px solid var(--color-border);
  transition: all 0.2s ease;
  overflow: hidden;
}

.letter-paper:hover {
  border-color: var(--color-primary);
}

.letter-content {
  position: relative;
  z-index: 2;
  color: var(--color-text);
}

.letter-header {
  text-align: center;
  margin-bottom: var(--spacing-xxl);
  display: flex;
  align-items: center;
  gap: var(--spacing-lg);
}

.header-line {
  flex: 1;
  height: 2px;
  background: linear-gradient(
    90deg,
    transparent 0%,
    rgba(224, 122, 95, 0.3) 20%,
    var(--color-primary) 50%,
    rgba(224, 122, 95, 0.3) 80%,
    transparent 100%
  );
  border-radius: 1px;
}

.letter-title {
  font-family: var(--font-family);
  font-size: clamp(24px, 4vw, 32px);
  font-weight: 700;
  color: var(--color-text);
  letter-spacing: -0.02em;
  white-space: nowrap;
  margin: 0;
  position: relative;
}

.letter-title::after {
  content: "";
  position: absolute;
  bottom: -8px;
  left: 50%;
  transform: translateX(-50%);
  width: 60px;
  height: 2px;
  background: linear-gradient(
    90deg,
    transparent 0%,
    var(--color-primary) 50%,
    transparent 100%
  );
  border-radius: 1px;
}

.letter-body {
  font-family: var(--font-family);
  font-size: clamp(16px, 2.5vw, 18px);
  line-height: 1.8;
  color: var(--color-text);
  text-align: left;
  margin-bottom: var(--spacing-xxl);
  letter-spacing: 0.01em;
}

.letter-body :deep(p) {
  margin-bottom: var(--spacing-lg);
  position: relative;
  padding-left: var(--spacing-md);
}

.letter-body :deep(p):first-of-type::first-letter {
  font-size: 3.5em;
  line-height: 0.8;
  float: left;
  margin: 8px 8px 0 0;
  font-family: var(--font-family);
  font-weight: 700;
  color: var(--color-primary);
}

.letter-body :deep(p::before) {
  content: "";
  position: absolute;
  left: 0;
  top: 0.7em;
  width: 3px;
  height: 3px;
  background: var(--color-primary);
  opacity: 0.6;
  border-radius: 50%;
}

.letter-signature {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  margin-top: var(--spacing-xxl);
  gap: var(--spacing-lg);
}

.signature-line {
  flex: 1;
  height: 1px;
  background: linear-gradient(
    90deg,
    var(--color-primary) 0%,
    rgba(224, 122, 95, 0.3) 80%,
    transparent 100%
  );
}

.signature-info {
  text-align: right;
  font-family: var(--font-family);
}

.signature-name {
  font-size: 20px;
  font-weight: 600;
  color: var(--color-text);
  margin: 0 0 4px 0;
}

.signature-alias {
  font-size: 16px;
  color: var(--color-text-secondary);
  font-style: italic;
  margin: 0 0 4px 0;
}

.signature-role {
  font-size: 14px;
  color: var(--color-primary);
  font-weight: 500;
  margin: 0;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

/* Responsive Design */
@media (max-width: 768px) {
  .ethics-letter-container {
    padding: var(--spacing-lg);
    margin: var(--spacing-xl) auto;
  }

  .letter-paper {
    padding: var(--spacing-xl);
  }

  .letter-header {
    flex-direction: column;
    gap: var(--spacing-md);
  }

  .header-line {
    width: 60px;
    flex: none;
  }

  .letter-title {
    order: -1;
  }

  .signature-info {
    text-align: center;
  }

  .signature-line {
    display: none;
  }
}

@media (max-width: 480px) {
  .letter-paper {
    padding: var(--spacing-lg);
    margin: var(--spacing-lg) 0;
  }

  .letter-body :deep(p):first-of-type::first-letter {
    font-size: 2.5em;
    margin: 4px 6px 0 0;
  }
}

/* Dark mode adaptations */
@media (prefers-color-scheme: dark) {
  .letter-paper {
    background: linear-gradient(
      135deg,
      rgba(78, 52, 46, 0.95) 0%,
      rgba(68, 42, 36, 0.95) 50%,
      rgba(58, 32, 26, 0.95) 100%
    );
    border: 1px solid rgba(220, 211, 197, 0.2);
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3), 0 8px 16px rgba(0, 0, 0, 0.2),
      inset 0 1px 0 rgba(255, 255, 255, 0.1);
  }

  .letter-content {
    color: var(--color-background);
  }

  .letter-title {
    color: var(--color-background);
  }

  .signature-name {
    color: var(--color-background);
  }

  .signature-alias {
    color: rgba(250, 246, 240, 0.7);
  }

  .letter-body {
    color: rgba(250, 246, 240, 0.9);
  }

  .letter-body :deep(p):first-of-type::first-letter {
    color: var(--color-highlight);
  }
}
</style>
