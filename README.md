# 📚 BookBuddy

BookBuddy is a personal book tracking app where users can register, log in, and manage a collection of books with reviews. Built with Ruby on Rails, it supports user authentication, book management, nested reviews, favoriting, and more. 

It also integrates **Kafka** and **Docker** in a **CI/CD pipeline**, and sends an email notification when a new book is created.

---

## 🚀 Live Demo

👉 [BookBuddy on Render](https://bookbuddy-koew.onrender.com/)

---

## 🛠️ Features

- ✅ User Sign-Up / Login / Logout (with sessions)
- 🔐 Authenticated access to user-specific books
- 📚 CRUD operations for books
- 📝 Nested reviews (each book can have many reviews)
- 💡 Flash messages for user feedback
- 🧼 Validations for clean data
- 🌐 Responsive Navbar with navigation
- ☁️ Deployed on Render
- 🐳 Dockerized development environment
- 🔁 Kafka integration (sends events when a book is created)
- 📧 Sends email notifications on book creation
- ⭐ Favorite / Unfavorite books
- 📊 Book status tracking (`Completed`, `Running`, `Wishlist`)
- 🛠️ CI/CD with GitHub Actions (runs tests and builds before deployment)

---

## 📷 Screenshots

![Screenshot (130)](https://github.com/user-attachments/assets/4dd0f248-9aaf-4864-be53-96e6793f0836)
![Screenshot (129)](https://github.com/user-attachments/assets/16641130-9235-4ff7-9812-15acd3c800b8) 
![Screenshot (134)](https://github.com/user-attachments/assets/9ce6833b-e3e7-4923-89db-ff91ad254a19)
![Screenshot (133)](https://github.com/user-attachments/assets/f955d304-b9d2-4a3b-8076-7b14dfa6aa25)
![Screenshot (132)](https://github.com/user-attachments/assets/62439e91-39ef-4b72-9fe8-fef125851283)
![Screenshot (131)](https://github.com/user-attachments/assets/836715f6-245c-4238-8d73-63fa7f1b1207)


LinkedIn POST(https://www.linkedin.com/posts/kommara-gunta-guna-priya-924b97297_rubyonrails-webdevelopment-opensource-activity-7340360505556942849-d2LN?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEfmgWwB7OTmoWCYf_ytrYdI6M9ZJQLtGe8)
---

## 🎥 App Preview (Video)

https://drive.google.com/file/d/1wMOtdHq-NqckcGPpgw2TkN5kraaHg2nK/view?usp=sharing

---

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
- `status` _(enum: `completed`, `running`, `wishlist`)_
- `user_id`
- `favorited` _(boolean or through a `favorites` join table)_

### Review

- `rating`
- `comment`
- `book_id`

---

## 🔐 Authentication

- Handled using `bcrypt` gem
- Sessions controller handles login/logout
- Only logged-in users can access and manage their own books

---

## 🧪 Validations

- Presence of email and name for users
- Presence of title and author for books
- Rating validation for reviews (1–5)

---

## ⚙️ CI/CD + Docker + Kafka

### 🐳 Docker

The app runs in a Dockerized environment including:

- Rails app
- PostgreSQL
- Kafka

Start everything with:

```bash
docker-compose up --build
🚀 CI/CD Pipeline
GitHub Actions runs tests and builds the app on push

Kafka events are simulated in CI using a local broker

DISABLE_KAFKA=true disables Kafka for test/CI

📧 Email Notification
When a new book is created, an email is sent to the logged-in user

Configured using ActionMailer and SMTP (e.g., Gmail or Mailtrap)

💡 Book Features
✅ Mark Status: Track reading status (completed, running, wishlist)

⭐ Favorite/Unfavorite: Keep track of your most loved books

💬 Nested Reviews: Review books with a 1–5 rating and comments

📦 Tech Stack
Ruby on Rails 8

PostgreSQL

Kafka (ruby-kafka)

Docker / Docker Compose

Redis (optional for background jobs)

GitHub Actions (CI/CD)

Render (deployment)

🛠️ Setup Instructions
bash
Copy
Edit
git clone https://github.com/your-username/bookbuddy.git
cd bookbuddy
cp .env.example .env

# Fill in the .env file with your secrets
docker-compose up --build
To run the app without Docker, make sure PostgreSQL, Kafka, and Redis (optional) are installed and configured locally.



