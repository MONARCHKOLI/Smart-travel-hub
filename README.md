# Smart Travel Hub
A smart Rails 8 travel hub featuring real-time weather forecasting, biometric face-lock security, and a full-service motel booking system with integrated food pre-ordering and kitchen preparation timers.

## Project Overview
- The mission: build a comprehensive "Smart Travel & Hospitality" hub designed to streamline the guest experience from weather planning to check-in and dining.
- Key problems solved: reduce check-in friction with pre-orders and improve security through biometric authentication.

## Core Features
- Weather Dashboard: live temperature and multi-day forecasts using the OpenWeather API.
- Biometric Security: face-lock authentication with automatic account lockout after two failed attempts.
- Motel Management: searchable motel listings with booking and check-in time updates.
- Pre-order Dining: order food with bookings and schedule kitchen preparation 15 minutes before arrival.
- Real-time Notifications: in-app and email alerts (MailCatcher in development) for booking confirmations and kitchen status.

## Tech Stack
- Framework: Rails 8.
- Frontend: Tailwind CSS and Hotwire (Turbo/Stimulus) for a modern responsive UI.
- Security: Devise (Lockable) and FaceIO/face-api.js for biometrics.
- Notifications: ActionCable for live updates and ActionMailer with MailCatcher.

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com
   cd smart_travel_hub
   ```
2. Install dependencies:
   ```bash
   bundle install
   ```
3. Setup database and credentials:
   ```bash
   rails db:create db:migrate
   rails credentials:edit
   ```
4. Run MailCatcher and start the Rails server:
   ```bash
   mailcatcher
   bin/dev
   ```

