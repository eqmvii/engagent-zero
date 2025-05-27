Now we're going to build a simple blog. 

Here is a sample image for design inspiration.

Please build a mock toolbar at the top, a mock title for the blog post, and a mock byline. Then add some lorem ipsum text for the blog post underneath.

Do not worry about a comments section - we will add that later. Use placeholders for images. The menu does not need to function.

---

Update json/users.json to include 4 users, each with a boring name. Include register date and dummy email address for each.

---

Now update json/comments.json to contain 3 short comments, and ensure each is authored by a different user from json/users.json

---

Now please build a comments section. Add it where the comment is in App.vue.

It should read json/comments.json to know the content of each comment. Each should include the user and their dummy avatar in a byline. 

The comments section is not nested, it's just a list top to bottom.

Each comment should have a placeholder reaction button, a placeholder reply button, and a placeholder AI Assist button

---

I found the issue. On GitHub pages, the JSON is in a subdirectory like this: https://eqmvii.github.io/engagent-zero/json/users.json

So after we build the files, we need to update all of the JSON references to prepend /engagent-zero/

---

above prompt did not work. Need to find issue manually and give more clear directions.

