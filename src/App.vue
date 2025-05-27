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
    <!-- AI Assist Modal -->
    <div v-if="showModal" class="modal-overlay" @click.self="closeModal">
      <div class="modal-content">
        <button class="modal-close" @click="closeModal">×</button>
        <h3>AI Assist Summary</h3>
        <div class="modal-body">
          <div v-if="loading" class="loading-state">
            <div class="spinner"></div>
            <p>{{ loadingMessage }}</p>
          </div>
          <div v-else v-html="formattedSummary"></div>
        </div>
      </div>
    </div>

    <div v-if="showSuggestModal" class="modal-overlay" @click.self="closeSuggestModal">
      <div class="modal-content modal-right">
        <button class="modal-close" @click="closeSuggestModal">×</button>
        <h3>AI Suggest</h3>
        <div class="modal-body">
          <div v-if="loading" class="loading-state">
            <div class="spinner"></div>
            <p>{{ loadingMessage }}</p>
          </div>
          <div v-else v-html="currentSummary"></div>
        </div>
      </div>
    </div>

    <main class="blog-content">
      <article class="blog-post">
        <h1 class="blog-title">Exploring the Genetic Link in Migraine Disorders</h1>
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
          <img src="https://placehold.co/1200x400/2c3e50/ffffff?text=Featured+Image" alt="Featured Image" style="width: 100%; height: auto; border-radius: 4px; margin: 2rem 0;">
        </div>
        
        <div class="post-content">
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
          
          <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
          
          <h2>Quis autem vel eum</h2>
          <p>Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.</p>
          
          <img src="https://placehold.co/800x300/2c3e50/ffffff?text=Content+Image" alt="Content Image" style="width: 100%; height: auto; border-radius: 4px; margin: 2rem 0;">
          
          <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.</p>
          
          <blockquote>
            The best way to predict the future is to implement it. - Alan Kay
          </blockquote>
          
          <p>Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum.</p>
        </div>
      </article>
      <div class="comments-section">
        <h2 class="section-title">Comments</h2>
        <div class="comments-list">
          <div v-for="comment in comments" :key="comment.id" class="comment-item">
            <div class="comment-header">
              <img :src="getUserById(comment.userId).avatar" :alt="getUserById(comment.userId).name" class="comment-avatar">
              <div class="comment-author">
                <span class="author-name">{{ getUserById(comment.userId).name }}</span>
                <span class="comment-date">{{ new Date(comment.timestamp).toLocaleDateString() }}</span>
              </div>
              <div class="comment-actions">
                <button class="action-button reaction">👍 {{ comment.likes }}</button>
                <button class="action-button reply" @click="toggleReply(comment.id)">Reply</button>
                <button class="action-button ai-assist admin-button" @click="openModal(comment['assist-summary'])">🔒 AI Assist</button>
              </div>
            </div>
            <div class="comment-content">
              <p>{{ comment.content }}</p>
            </div>
            <div style="padding: 1rem 0"></div>
            <!-- Reply form -->
            <div v-if="activeReply === comment.id" class="reply-form">
              <textarea 
                v-model="replyText" 
                class="reply-input" 
                placeholder="Write your reply..." 
                rows="3"
                style="
                  width: 100%;
                  padding: 1rem;
                  box-sizing: border-box;
                "
              ></textarea>
              <div class="reply-actions">
                <button class="action-button submit" @click="submitReply">Submit</button>
                <button class="action-button ai-assist admin-button" @click="openSuggestModal(comment.id)">🔒 AI Suggest</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <footer class="footer">
      <div class="footer-content">
        <div class="footer-section">
          <h3 class="footer-heading">MyBrain.com</h3>
          <p class="footer-description">Sharing thoughts on technology, design, and everything in between.</p>
        </div>
        <nav class="footer-nav">
          <h4 class="nav-heading">Navigation</h4>
          <ul class="nav-links">
            <li><a href="#" class="nav-link">Home</a></li>
            <li><a href="#" class="nav-link">Categories</a></li>
            <li><a href="#" class="nav-link">About</a></li>
            <li><a href="#" class="nav-link">Contact</a></li>
          </ul>
        </nav>
        <div class="footer-legal">
          <h4 class="legal-heading">Legal</h4>
          <ul class="legal-links">
            <li><a href="#" class="legal-link">Privacy Policy</a></li>
            <li><a href="#" class="legal-link">Terms of Service</a></li>
            <li><a href="#" class="legal-link">Cookie Policy</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <p class="copyright"> 2025 MyBrain.com. All rights reserved.</p>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'App',
  components: {},
  data() {
    return {
      comments: [],
      users: [],
      showModal: false,
      showSuggestModal: false,
      currentSummary: '',
      activeReply: null,
      replyText: '',
      loading: false,
      loadingMessage: ''
    }
  },
  computed: {
    formattedSummary() {
      // Convert periods followed by a space to line breaks for better readability
      return (this.currentSummary || '').replace(/\. /g, '.<br><br>');
    }
  },
  async mounted() {
    // Helper function to fetch JSON data with error handling
    const fetchJson = async (path) => {
      try {
        // Try the direct path first (works in development)
        const response = await fetch(path);
        if (response.ok) return await response.json();
        
        // If direct path fails, try with the public path (works in production)
        const publicResponse = await fetch(`/engagent-zero${path}`);
        if (publicResponse.ok) return await publicResponse.json();
        
        throw new Error(`Failed to fetch ${path}`);
      } catch (error) {
        console.error('Error fetching data:', error);
        return { users: [], comments: [] }; // Return empty data if fetch fails
      }
    };

    try {
      // Fetch users data
      const usersData = await fetchJson('/json/users.json');
      this.users = usersData.users || [];

      // Fetch comments data
      const commentsData = await fetchJson('/json/comments.json');
      this.comments = commentsData.comments || [];
    } catch (error) {
      console.error('Error initializing data:', error);
    }
  },
  methods: {
    getUserById(userId) {
      return this.users.find(user => user.id === userId);
    },
    openModal(summary) {
      this.loading = true;
      this.loadingMessage = 'Sending historical user data to Gemini for processing...';
      this.showModal = true;
      document.body.style.overflow = 'hidden'; // Prevent scrolling when modal is open
      
      // Wait 3 seconds before showing content
      setTimeout(() => {
        this.currentSummary = summary || 'No summary available.';
        this.loading = false;
      }, 2000);
    },
    openSuggestModal(commentId) {
      this.loading = true;
      this.loadingMessage = 'Sending historical user data to Gemini for processing...';
      const comment = this.comments.find(c => c.id === commentId);
      this.showSuggestModal = true;
      document.body.style.overflow = 'hidden'; // Prevent scrolling when modal is open
      
      // Wait 3 seconds before showing content
      setTimeout(() => {
        this.currentSummary = comment?.['ai-suggest-comment'] || 'No suggestion available.';
        this.loading = false;
      }, 2000);
    },
    closeModal() {
      this.showModal = false;
      document.body.style.overflow = 'auto'; // Re-enable scrolling
    },
    closeSuggestModal() {
      this.showSuggestModal = false;
      document.body.style.overflow = 'auto'; // Re-enable scrolling
    },
    toggleReply(commentId) {
      this.activeReply = this.activeReply === commentId ? null : commentId;
      this.replyText = '';
    },
    submitReply() {
      // Mock submit functionality (no actual submission)
      this.activeReply = null;
      this.replyText = '';
    }
  }
}
</script>

<style>
@import './styles/global.css';

/* Footer Styles */
.footer {
  background-color: #2c3e50;
  color: #ecf0f1;
  padding: 4rem 2rem 2rem;
  margin-top: 4rem;
  margin-top: 6rem; /* Adjusted to accommodate the reply form */
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  padding-bottom: 2rem;
}

.footer-section {
  margin-bottom: 2rem;
}

.footer-heading {
  color: #fff;
  font-size: 1.5rem;
  margin-bottom: 1rem;
  font-weight: 600;
}

.footer-description {
  color: #bdc3c7;
  line-height: 1.6;
  max-width: 300px;
}

.nav-heading,
.legal-heading {
  color: #fff;
  font-size: 1.1rem;
  margin-bottom: 1.25rem;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

/* Header Navigation */
.toolbar .nav-links {
  display: flex;
  flex-direction: row;
  gap: 1.5rem;
  margin: 0 2rem;
}

.toolbar .nav-link {
  color: #2c3e50;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.2s;
}

.toolbar .nav-link:hover {
  color: var(--primary-color);
}

/* Footer Navigation */
.footer .nav-links,
.legal-links {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.nav-link,
.legal-link {
  color: #bdc3c7;
  text-decoration: none;
  transition: color 0.2s;
  display: inline-block;
}

.nav-link:hover,
.legal-link:hover {
  color: #3498db;
}

.footer-bottom {
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  padding-top: 2rem;
  text-align: center;
}

.copyright {
  color: #7f8c8d;
  font-size: 0.9rem;
  margin: 0;
}

@media (max-width: 768px) {
  .footer-content {
    grid-template-columns: 1fr;
    gap: 2.5rem;
  }
  
  .footer-section,
  .footer-nav,
  .footer-legal {
    text-align: center;
  }
  
  .footer-description {
    margin: 0 auto;
  }
  
  .nav-links,
  .legal-links {
    align-items: center;
  }
}

/* AI Assist Modal Styles */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  padding: 2rem;
}

.spinner {
  width: 40px;
  height: 40px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #2c3e50;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.loading-state p {
  color: #666;
  font-size: 1rem;
  text-align: center;
}

.modal-right {
  position: absolute;
  right: 0;
  top: 0;
  width: 300px;
  height: 100%;
  display: flex;
  flex-direction: column;
  padding: 2rem;
}

.modal-content {
  background: white;
  border-radius: 8px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
  max-width: 500px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  position: relative;
  padding: 2rem;
  margin-left: 2rem;
  margin-top: 2rem;
  animation: slideIn 0.3s ease-out;
}

@keyframes slideIn {
  from {
    transform: translateX(-20px);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
}

.modal-close {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
  color: #666;
  padding: 0.25rem 0.5rem;
  line-height: 1;
  transition: color 0.2s;
}

.modal-close:hover {
  color: #000;
}

.modal-content h3 {
  margin-top: 0;
  color: var(--primary-color);
  font-size: 1.5rem;
  margin-bottom: 1.5rem;
  padding-right: 2rem;
}

.modal-body {
  line-height: 1.6;
  color: #333;
}

.modal-body strong {
  color: #2c3e50;
  font-weight: 600;
}

/* Comment Styles */
.comments-section {
  margin-top: 4rem;
  padding-top: 2rem;
  border-top: 1px solid #eee;
}

.section-title {
  font-size: 1.5rem;
  margin-bottom: 1.5rem;
  color: var(--primary-color);
}

.comments-list {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.comment-item {
  background: #fff;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.comment-header {
  display: flex;
  align-items: center;
  margin-bottom: 1rem;
  gap: 1rem;
}

.comment-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
}

.comment-author {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.author-name {
  font-weight: 600;
  color: var(--primary-color);
}

.comment-date {
  font-size: 0.85rem;
  color: #666;
}

.comment-actions {
  display: flex;
  gap: 0.5rem;
}

.action-button {
  background: none;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  font-size: 0.9rem;
  cursor: pointer;
  transition: all 0.2s;
}

.action-button:hover {
  background: rgba(0,0,0,0.05);
}

.reaction {
  color: #4CAF50;
}

.reply {
  color: #2196F3;
}

.ai-assist {
  color: #FF9800;
}

.comment-content {
  color: #333;
  line-height: 1.6;
}

/* Byline Styles */
.byline {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin: 1rem 0;
  padding: 0.5rem 0;
  border-bottom: 1px solid #eee;
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

.admin-button {
  background-color: #ff6b6b;
  color: white;
  border: 1px solid #ff6b6b;
  font-weight: 500;
  margin-left: 0.5rem;
  transition: all 0.2s ease;
}

.admin-button:hover {
  background-color: #ff5252;
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(255, 107, 107, 0.2);
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
