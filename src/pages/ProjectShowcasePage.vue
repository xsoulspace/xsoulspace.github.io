.project-links {
  margin-top: var(--spacing-lg);
  display: flex;
  gap: var(--spacing-md);
}

.badge-icon {
  height: 40px;
}

.scroll-snap-section {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--spacing-xl);
  min-height: 100vh;
  padding: var(--spacing-xl);
}

.content-column {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-xxl);
}

.content-item {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: var(--spacing-xl);
  background: var(--color-surface);
  border-radius: var(--border-radius-lg);
  border: 1px solid var(--color-border);
}

.visual-column {
  position: sticky;
  top: 0;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.visual-container {
  position: relative;
  width: 100%;
  height: 80%;
  max-width: 500px;
  max-height: 700px;
}

.visual-item {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  transition: opacity 0.5s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.visual-item.is-active {
  opacity: 1;
}

.media-placeholder {
  width: 100%;
  height: 100%;
  background-color: var(--color-border);
  border-radius: var(--border-radius-lg);
  display: flex;
  align-items: center;
  justify-content: center;
}

.media-placeholder img {
  max-width: 100%;
  max-height: 100%;
  border-radius: var(--border-radius-lg);
}

@media (max-width: 768px) {
  .scroll-snap-section {
    grid-template-columns: 1fr;
    padding: var(--spacing-lg);
  }
  .visual-column {
    order: -1; /* Visuals first on mobile */
    position: relative;
    height: 50vh;
  }
  .content-item {
    min-height: 50vh;
  }
}