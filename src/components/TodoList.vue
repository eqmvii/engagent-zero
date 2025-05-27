<template>
  <div class="todo-container">
    <h2 class="section-title">Todo List</h2>
    <div class="todo-input">
      <input
        v-model="newTodo"
        @keyup.enter="addTodo"
        type="text"
        placeholder="Add a new task..."
        class="input"
      />
      <button @click="addTodo" class="button secondary">Add</button>
    </div>
    <ul class="todo-list">
      <li v-for="(todo, index) in todos" :key="index" class="todo-item">
        <input
          type="checkbox"
          :checked="todo.completed"
          @change="toggleTodo(index)"
          class="todo-checkbox"
        />
        <span :class="{ 'completed': todo.completed }">{{ todo.text }}</span>
        <button @click="removeTodo(index)" class="button remove">×</button>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newTodo: '',
      todos: []
    }
  },
  methods: {
    addTodo() {
      if (this.newTodo.trim()) {
        this.todos.push({
          text: this.newTodo.trim(),
          completed: false
        })
        this.newTodo = ''
      }
    },
    toggleTodo(index) {
      const isCompleted = this.todos[index].completed = !this.todos[index].completed
      if (isCompleted) {
        this.$emit('todo-completed')
      }
    },
    removeTodo(index) {
      this.todos.splice(index, 1)
    }
  }
}
</script>

<style scoped>
.todo-container {
  padding: 2.5rem;
  border-radius: 20px;
  margin: 2rem 0;
  background: var(--background-tertiary);
  border: var(--glass-border);
}

.section-title {
  color: var(--text-primary);
  margin-bottom: 1.75rem;
  font-size: 1.875rem;
  font-weight: 600;
  letter-spacing: -0.02em;
}

.todo-input {
  display: flex;
  gap: 1.25rem;
  margin-bottom: 2.25rem;
}

.input {
  flex: 1;
  padding: 1.25rem;
  border-radius: 12px;
  background: var(--background-secondary);
  color: var(--text-primary);
  border: var(--glass-border);
  transition: all var(--transition-duration) ease;
}

.input:focus {
  outline: none;
  border-color: var(--accent-color);
  box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.15);
}

.button.secondary {
  background: transparent;
  border: 1px solid var(--accent-color);
  color: var(--text-primary);
  padding: 0.875rem 1.75rem;
  font-size: 1.1rem;
  font-weight: 500;
  letter-spacing: -0.02em;
}

.button.secondary:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-2px);
}

.todo-list {
  list-style: none;
  padding: 0;
}

.todo-item {
  display: flex;
  align-items: center;
  padding: 1.5rem;
  border-bottom: 1px solid var(--border-color);
  transition: all var(--transition-duration) ease;
}

.todo-item:last-child {
  border-bottom: none;
}

.todo-item:hover {
  background: rgba(255, 255, 255, 0.05);
  transform: translateY(-2px);
}

.todo-checkbox {
  margin-right: 1.25rem;
  width: 1.5rem;
  height: 1.5rem;
  accent-color: var(--accent-color);
  border: 2px solid var(--text-quaternary);
  border-radius: 4px;
}

.todo-checkbox:checked {
  border-color: var(--accent-color);
}

.todo-item-text {
  flex: 1;
  font-size: 1.1rem;
  line-height: 1.5;
  color: var(--text-primary);
}

.completed {
  text-decoration: line-through;
  color: var(--text-quaternary);
  opacity: 0.8;
  transition: all var(--transition-duration) ease;
}

.button.remove {
  margin-left: auto;
  background: transparent;
  border: none;
  color: var(--text-quaternary);
  font-size: 1.75rem;
  padding: 0.75rem;
  transition: all var(--transition-duration) ease;
}

.button.remove:hover {
  color: var(--text-secondary);
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-2px);
}
</style>
