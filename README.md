# 📚 BookBuddy

BookBuddy is a personal book tracking app where users can register, log in, and manage a collection of books with reviews. Built with Ruby on Rails, it supports user authentication, book management, and nested reviews.

## 🚀 Live Demo

👉 [BookBuddy on Render](https://bookbuddy-koew.onrender.com/)

---

## 🛠️ Features

- User Sign-Up / Login / Logout (with sessions)
- Authenticated access to user-specific books
- CRUD operations for books
- Nested reviews (each book can have many reviews)
- Flash messages for user feedback
- Validations for clean data
- Responsive Navbar with navigation
- Deployed on Render

---

<!-- ## 📷 Screenshots

> _Add screenshots of your app here (e.g., homepage, login screen, book form, etc.)_

--- -->

## 🧱 Models

### User

- `name`
- `email`
- `password_digest`

### Book

- `title`
- `author`
- `genre`
- `notes`
- `user_id`

### Review

- `rating`
- `comment`
- `book_id`

---

## 🔐 Authentication

- Handled using `bcrypt` gem.
- Sessions controller handles login/logout.
- Only logged-in users can access and manage their own books.

---

## 🧪 Validations

- Email and name presence validation for users
- Title and author presence for books
- Rating validation for reviews (1–5)

---
