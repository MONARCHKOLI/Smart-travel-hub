# Smart-travel-hub
A smart Rails 8 travel hub featuring real-time weather forecasting, biometric face-lock security, and a full-service motel booking system with integrated food pre-ordering and kitchen preparation timers.


# A high-quality README should include the following sections to provide a professional overview:
1. Project Overview
   * The Mission: A comprehensive "Smart Travel & Hospitality" hub designed to streamline the guest experience from weather planning to check-in and dining.
   * Key Problems Solved: Reduces check-in friction with pre-orders and ensures high account security via biometric authentication.
     
3. Core Features
   * Weather Dashboard: Live temperature and multi-day forecasts using the OpenWeather API.
   * Biometric Security: Face-lock authentication with an automatic account lockout after two failed attempts.
   * Motel Management: Searchable motel listings with booking and check-in time update functionality.
   * Pre-order Dining: Order food alongside your booking with a "ready-15-mins-before" scheduling logic.
   * Real-time Notifications: In-app and email alerts (via MailCatcher in development) for booking confirmations and kitchen status.
     
5. Tech Stack
   * Framework: Rails 8 (latest version).
   * Frontend: Tailwind CSS & Hotwire (Turbo/Stimulus) for a modern, "No-Build" responsive UI.
   * Security: Devise (Lockable) and FaceIO/Face-api.js for biometrics.
   * Notifications: ActionCable for live updates and ActionMailer with MailCatcher.
     
6. Setup InstructionsProvide clear steps to get the project running locally:

```bash
# Clone the repository
git clone https://github.com
cd smart_travel_hub

# Install dependencies
bundle install

# Setup database and credentials
rails db:create db:migrate
# Add your OpenWeather API key here
rails credentials:edit

# Run MailCatcher and the Rails server
mailcatcher
bin/dev
```

