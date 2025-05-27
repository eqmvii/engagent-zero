<template>
  <div class="app-container">
    <!-- Toolbar -->
    <header class="toolbar">
      <div class="toolbar-content">
        <a href="/" class="logo">MyBrain.com</a>
        <nav class="nav-links">
          <a href="#" class="nav-link">Categories</a>
          <a href="#" class="nav-link">About</a>
          <a href="#" class="nav-link">Contact</a>
        </nav>
        <div class="search">
          <input type="text" placeholder="Search..." class="search-input">
          <button class="search-button">🔍</button>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <main class="blog-content">
      <article class="blog-post">
        <h1 class="blog-title">The Future of Web Development: Trends to Watch in 2025</h1>
        <div class="byline">
          <img src="https://placehold.co/40/2c3e50/ffffff?text=JD" alt="Jane Doe" class="author-avatar">
          <div class="byline-content">
            <div class="author">By Jane Doe</div>
            <div class="byline-meta">
              <span class="date">May 27, 2025</span>
              <span class="divider">•</span>
              <span class="read-time">5 min read</span>
            </div>
          </div>
        </div>
        
        <div class="featured-image">
          <div class="image-placeholder">Featured Image</div>
        </div>
        
        <div class="post-content">
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in dui mauris. Vivamus hendrerit arcu sed erat molestie vehicula. Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor. Suspendisse dictum feugiat nisl ut dapibus.</p>
          
          <p>Vestibulum auctor dapibus neque. Maecenas sed nisi in arcu semper venenatis. Fusce congue, elit ac semper ullamcorper, sem neque sed risus. Cras varius, orci ac feugiat aliquet, nunc orci tincidunt nisl, eget aliquam nisl nunc vel nisi.</p>
          
          <h2>Emerging Technologies</h2>
          <p>Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.</p>
          
          <img src="https://placehold.co/800x300/2c3e50/ffffff?text=Content+Image" alt="Content Image" style="width: 100%; height: auto; border-radius: 4px; margin: 2rem 0;">
          
          <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.</p>
          
          <blockquote>
            The best way to predict the future is to implement it. - Alan Kay
          </blockquote>
          
          <p>Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum.</p>
        </div>
      </article>
      <!-- TODO: Comments Section -->
    </main>
    
    <footer class="footer">
      <div class="footer-content">
        <div class="footer-section">
          <h3>About BlogName</h3>
          <p>Sharing thoughts on technology, design, and everything in between.</p>
        </div>
        <div class="footer-links">
          <a href="#" class="footer-link">Home</a>
          <a href="#" class="footer-link">About</a>
          <a href="#" class="footer-link">Contact</a>
          <a href="#" class="footer-link">Privacy Policy</a>
        </div>
      </div>
      <div class="footer-bottom">
        <p> 2025 BlogName. All rights reserved.</p>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'App',
  components: {}
}
</script>

<style>
@import './styles/global.css';

/* Byline Styles */
.byline {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin: 2rem 0;
  padding: 1rem 0;
}

.author-avatar {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #f5f5f5;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  flex-shrink: 0;
}

.byline-content {
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 0.25rem;
}

.author {
  font-weight: 600;
  color: var(--primary-color);
  font-size: 1rem;
  line-height: 1.2;
}

.byline-meta {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  font-size: 0.85rem;
  color: #777;
  line-height: 1.2;
}

.byline-meta .divider {
  color: #ddd;
}

:root {
  --primary-color: #2c3e50;
  --secondary-color: #42b983;
  --text-color: #333;
  --light-gray: #f5f5f5;
  --border-color: #e0e0e0;
  --max-content-width: 800px;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  line-height: 1.6;
  color: var(--text-color);
  background-color: #fff;
}

.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

/* Toolbar Styles */
.toolbar {
  background-color: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  position: sticky;
  top: 0;
  z-index: 1000;
}

.toolbar-content {
  max-width: var(--max-content-width);
  margin: 0 auto;
  padding: 1rem 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--primary-color);
  text-decoration: none;
  transition: color 0.2s;
}

.logo:hover {
  color: var(--secondary-color);
}

.nav-links {
  display: flex;
  gap: 2rem;
}

.nav-link {
  color: var(--text-color);
  text-decoration: none;
  font-weight: 500;
  transition: color 0.2s;
}

.nav-link:hover {
  color: var(--secondary-color);
}

.search {
  display: flex;
  align-items: center;
}

.search-input {
  padding: 0.5rem 1rem;
  border: 1px solid var(--border-color);
  border-radius: 4px 0 0 4px;
  outline: none;
}

.search-button {
  padding: 0.5rem 1rem;
  background-color: var(--primary-color);
  color: white;
  border: none;
  border-radius: 0 4px 4px 0;
  cursor: pointer;
}

/* Blog Content Styles */
.blog-content {
  flex: 1;
  max-width: var(--max-content-width);
  width: 100%;
  margin: 0 auto;
  padding: 2rem;
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
