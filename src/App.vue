<template>
  <div class="app-container" :class="{ 'strobing': strobing }">
    <h2 class="title">👋 I was a Vue3 app served from a docker container on a windows machine without node installed.</h2>
    <h2 class="title">Now I'm a Vite-built bundle served on GH pages.</h2>
    <button @click="toggleMessage" class="button primary">Toggle Snow</button>
    <p v-if="showMessage" class="message">{{ message }}</p>
  <div v-if="showMessage" class="snow-container">
    <div class="snowflake" v-for="i in 50" :key="i" :style="{
      animationDelay: `${Math.random() * 5}s`,
      left: `${Math.random() * 100}%`
    }"></div>
  </div>
    
    <div class="components-container">
      <TodoList @todo-completed="startStrobe" />
      <h2 class="title">"Add a complete working copy of the game simon underneath the todolist."</h2>
      <SimonGame />
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
import TodoList from './components/TodoList.vue'
import SimonGame from './components/SimonGame.vue'

export default {
  components: {
    TodoList,
    SimonGame
  },
  data() {
    return {
      message: 'SWE-1-lite did this!',
      showMessage: false,
      strobing: false
    }
  },
  methods: {
    toggleMessage() {
      this.showMessage = !this.showMessage
    },
    startStrobe() {
      this.strobing = true
      setTimeout(() => {
        this.strobing = false
      }, 3000)
    }
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

.button.primary {
  background: var(--accent-color);
  color: var(--background-primary);
  padding: 1.25rem 2.5rem;
  font-size: 1.2rem;
  font-weight: 600;
  letter-spacing: -0.02em;
}

.button.primary:hover {
  background: var(--accent-hover);
  transform: translateY(-2px);
}

.message {
  color: var(--text-primary);
  font-size: 1.5rem;
  margin: 2rem 0;
  padding: 1rem 2rem;
  background: var(--background-primary);
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.snow-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 1;
}

.snowflake {
  position: absolute;
  width: 3px;
  height: 3px;
  background: white;
  border-radius: 50%;
  animation: fall 5s linear infinite;
  transform-origin: center center;
  opacity: 0.7;
}

@keyframes fall {
  0% {
    transform: translateY(0) rotate(0deg);
    opacity: 1;
  }
  100% {
    transform: translateY(100vh) rotate(360deg);
    opacity: 0;
  }
}

.snowflake:nth-child(odd) {
  background: rgba(255, 255, 255, 0.8);
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
