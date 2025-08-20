<template>
  <div id="app-container">
    <header class="app-header">
      <h1>My Portfolio</h1>
      <nav>
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Projects</a>
      </nav>
    </header>
    <main class="app-main">
      <ProjectGrid />
    </main>
    <footer class="app-footer">
      <p>&copy; 2025 My Name</p>
    </footer>
  </div>
</template>

<script setup lang="ts">
import ProjectGrid from './components/ProjectGrid.vue';
</script>

<style lang="scss">
// Global styles
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  margin: 0;
  background-color: #f0f2f5;
  color: #333;
}

#app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.app-header {
  background-color: #fff;
  padding: 1rem 2rem;
  border-bottom: 1px solid #ddd;
  display: flex;
  justify-content: space-between;
  align-items: center;

  h1 {
    margin: 0;
    font-size: 1.5rem;
  }

  nav a {
    margin-left: 1.5rem;
    text-decoration: none;
    color: #555;
    font-weight: 500;

    &:hover {
      color: #007bff;
    }
  }
}

.app-main {
  flex: 1;
  padding: 2rem;
}

.app-footer {
  background-color: #fff;
  padding: 1rem 2rem;
  border-top: 1px solid #ddd;
  text-align: center;
  font-size: 0.9rem;
  color: #777;
}
</style>
