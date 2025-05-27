<template>
  <div class="simon-container">
    <div class="simon-header">
      <h2>Simon Says</h2>
      <div class="score">Score: {{ score }}</div>
    </div>
    <div class="simon-grid">
      <div
        v-for="(color, index) in colors"
        :key="index"
        :class="['simon-pad', color, { 'active': activePad === index }]"
        @click="handlePadClick(index)"
      ></div>
    </div>
    <div class="simon-controls">
      <button @click="startGame" class="button primary">Start</button>
      <button @click="resetGame" class="button secondary">Reset</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      colors: ['red', 'green', 'yellow', 'blue'],
      sequence: [],
      currentStep: 0,
      isPlaying: false,
      activePad: null,
      score: 0,
      gameSpeed: 800
    }
  },
  methods: {
    startGame() {
      this.resetGame()
      this.generateSequence()
      this.playSequence()
    },
    resetGame() {
      this.sequence = []
      this.currentStep = 0
      this.score = 0
      this.isPlaying = false
    },
    generateSequence() {
      this.sequence.push(Math.floor(Math.random() * 4))
      this.score = this.sequence.length - 1
    },
    async playSequence() {
      this.isPlaying = true
      // Clear any active pad state
      this.activePad = null
      
      // Add a small delay before starting the sequence
      await this.sleep(500)
      
      for (let i = 0; i < this.sequence.length; i++) {
        await this.flashPad(this.sequence[i])
        // Use gameSpeed for gap between flashes for consistency
        await this.sleep(this.gameSpeed)
      }
      
      // Small delay before allowing player input
      await this.sleep(500)
      this.isPlaying = false
    },
    async flashPad(padIndex) {
      this.activePad = padIndex
      await this.sleep(this.gameSpeed)
      this.activePad = null
    },
    sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms))
    },
    handlePadClick(padIndex) {
      if (this.isPlaying) return

      this.activePad = padIndex
      setTimeout(() => {
        this.activePad = null
      }, this.gameSpeed)

      if (padIndex === this.sequence[this.currentStep]) {
        this.currentStep++

        if (this.currentStep === this.sequence.length) {
          this.generateSequence()
          this.playSequence()
          this.currentStep = 0
        }
      } else {
        this.resetGame()
      }
    }
  }
}
</script>

<style scoped>
.simon-container {
  padding: 2rem;
  border-radius: 20px;
  background: var(--background-tertiary);
  border: var(--glass-border);
  margin: 2rem 0;
  text-align: center;
}

.simon-header {
  margin-bottom: 1.5rem;
}

.score {
  margin-top: 0.5rem;
  font-size: 1.2rem;
  color: var(--text-primary);
}

.simon-grid {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 1.5rem;
  margin: 2rem 0;
  justify-items: center;
}

.simon-pad {
  aspect-ratio: 1;
  border-radius: 50%;
  cursor: pointer;
  transition: all 0.2s ease;
  width: 200px;
  height: 200px;
  border: 4px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.simon-pad:hover {
  transform: scale(1.1);
  box-shadow: 0 0 30px rgba(255, 255, 255, 0.3);
}

.simon-pad.active {
  transform: scale(1.2);
  box-shadow: 0 0 40px rgba(255, 255, 255, 0.4);
  border-width: 6px;
}

.red {
  background: #ff4444;
}

.green {
  background: #44ff44;
}

.yellow {
  background: #ffff44;
}

.blue {
  background: #4444ff;
}

.simon-controls {
  display: flex;
  gap: 1rem;
  justify-content: center;
  margin-top: 1.5rem;
}

.button {
  padding: 0.875rem 1.75rem;
  border-radius: 12px;
  font-size: 1.1rem;
  cursor: pointer;
  transition: all 0.2s ease;
}

.button.primary {
  background: var(--accent-color);
  color: var(--background-primary);
}

.button.secondary {
  background: transparent;
  border: 1px solid var(--accent-color);
  color: var(--text-primary);
}

.button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
</style>
