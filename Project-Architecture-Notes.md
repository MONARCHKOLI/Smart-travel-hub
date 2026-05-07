# Project Architecture Notes

## Phase 1: The Core MVP (Minimum Viable Product)
Focus: Security, Weather, and the Booking Engine.

### Integration Points
- **OpenWeather API**: Fetch current and future weather data.
- **Devise (Lockable)**: Authentication with a "2-strike" lockout rule.
- **ActionMailer + MailCatcher**: Local email testing environment.
- **Tailwind CSS**: Responsive UI layout.

### The Flow
- **Entry**: User arrives at the Home Page and sees weather information.
- **Auth**: Face Lock login attempt. If the user fails more than 2 times, the account locks and an email is sent via MailCatcher.
- **Browse**: User views motel listings and available rooms.
- **Booking & Pre-order**: User selects a room and adds food to the cart.
- **Payment**: User pays a partial deposit to lock the room and the kitchen order.
- **Scheduling**: System calculates check-in time, prep time, and sends a kitchen alert 15 minutes before arrival.

## Phase 2: Advanced Customization & Revenue
Focus: The "No-Code" UI Builder and Monetization.

### Key Additions
- **Drag & Drop UI**: Integrate SortableJS with Rails to let admins reorder homepage sections (for example, move the Weather widget above the Motel list).
- **Banner/Ad System**: Add a Banner model for uploading images and links to promote motels or food items.
- **Content Slots**: Define toggleable regions in the layout (for example, "Show Weather Dashboard: True/False").

### The Flow
- **Admin Panel**: An "Edit Mode" where components become draggable.
- **Persistence**: Save new positions to a `UserPreference` or `LayoutConfig` table via AJAX/Fetch.
- **Ad Injection**: Display banners between motel listings based on "sponsored" status.

## What Needs to be Covered (The "Hidden" Tasks)
- **Background Jobs**: Use Solid Queue (Rails 8 default) to handle 15-minute notification timers so they don't block the main app.
- **State Machine**: Use a gem like `aasm` for food orders (`pending -> preparing -> ready -> served`).
- **Edge Case Logic**: If the user updates check-in time, automatically shift the food prep timer.
- **Validation**: Restrict check-in updates when too close to arrival (for example, do not allow changes with less than 2 hours remaining).

## Development Roadmap Summary
| Phase | Focus | Main Tech |
|---|---|---|
| Phase 1 | Stability & Flow | Rails scaffolds, Devise, service objects, ActionMailer |
| Phase 2 | Customization | SortableJS, Stimulus, ActiveStorage (for banners) |
| Phase 3 | Polishing | ActionCable (live timers), advanced analytics |
