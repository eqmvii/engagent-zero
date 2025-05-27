<template>
  <div class="app-container" :class="{ 'strobing': strobing }">
    <div class="components-container">
    </div>
    <footer class="footer">
      <div class="footer-content">
        <a href="https://github.com/eqmvii" target="_blank" class="github-link">
          <span class="github-icon">⭐</span>
          <span class="github-text">eqmvii</span>
        </a>
        <a href="https://github.com/eqmvii/vibe-code-1" target="_blank" class="repo-link">
          <span class="repo-icon">📦</span>
          <span class="repo-text">vibe-code-1</span>
        </a>
      </div>
    </footer>
  </div>
</template>

<script>


export default {
  components: {},
  data() {
    return {}
  }
}
</script>

<style>
@import './styles/global.css';

.app-container {
  text-align: center;
  padding: 4rem 2rem;
  max-width: 800px;
  margin: 0 auto;
  background: var(--background-secondary);
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  overflow: hidden;
}

.footer {
  width: 100%;
  padding: 2rem;
  background: var(--background-tertiary);
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  text-align: center;
  margin-top: auto;
}

.footer-content {
  display: flex;
  justify-content: center;
  gap: 2rem;
  max-width: 800px;
  margin: 0 auto;
}

.github-link, .repo-link {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  color: var(--text-primary);
  text-decoration: none;
  transition: all 0.2s ease;
  padding: 0.5rem 1rem;
  border-radius: 8px;
}

.github-link:hover, .repo-link:hover {
  background: rgba(255, 255, 255, 0.05);
  transform: translateY(-2px);
}

.github-icon, .repo-icon {
  font-size: 1.2rem;
}

.github-text, .repo-text {
  font-weight: 500;
}

.app-container.strobing {
  animation: strobe 0.1s infinite;
}

@keyframes strobe {
  0% { background: var(--background-secondary); }
  50% { background: rgba(255, 0, 0, 0.5); }
  100% { background: var(--background-secondary); }
}

.title {
  color: var(--text-primary);
  margin-bottom: 2.5rem;
  font-size: 2rem; /* Reduced from 2.8rem to 2rem (about 30% smaller) */
  letter-spacing: -0.05em;
  font-weight: 700;
  background: linear-gradient(135deg, var(--text-primary), var(--text-secondary));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.components-container {
  display: flex;
  flex-direction: column;
  gap: 3rem;
  width: 100%;
}



.snowflake:nth-child(3n) {
  animation-duration: 3s;
}

.snowflake:nth-child(5n) {
  animation-duration: 7s;
}

.snowflake:nth-child(7n) {
  animation-duration: 4s;
}

.snowflake:nth-child(9n) {
  animation-duration: 6s;
}

/* Glass effect for components */
.components-container > * {
  @apply glass;
}

/* Smooth transitions */
.app-container, .components-container > * {
  transition: all var(--transition-duration) ease;
}

/* Hover effects */
.components-container > *:hover {
  transform: translateY(-4px);
  box-shadow: 0 16px 64px var(--shadow-color);
}

/* Smooth scroll */
.app-container {
  scroll-behavior: smooth;
  overflow-y: auto;
}

::-webkit-scrollbar {
  width: 8px;
  background: var(--background-secondary);
}

::-webkit-scrollbar-track {
  background: var(--background-secondary);
}

::-webkit-scrollbar-thumb {
  background: var(--text-quaternary);
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: var(--text-secondary);
}
</style>
