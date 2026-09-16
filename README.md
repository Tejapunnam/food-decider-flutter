# 🍽️ Food Decider

> A simple and interactive Flutter application that helps you decide what to eat when you can't choose.

Food Decider removes the stress of choosing a meal by allowing users to select a food category and randomly generate a food recommendation with a single tap.

---

## ✨ Features

- 🎲 **Random Food Decision**  
  Randomly selects a food from the available options.

- 🍕 **Food Categories**  
  Choose from:
  - Any Food
  - Indian
  - Fast Food
  - Healthy
  - Desserts

- ❤️ **Favorites**  
  Save your favorite food choices for quick access.

- 📜 **Decision History**  
  View previously selected foods.

- 🍽️ **My Foods**  
  Add your own custom food choices.

- 🔀 **No Repeat Mode**  
  Prevents foods from being selected again until the available options have been used.

- ⚙️ **Settings**  
  Manage application options and view food statistics.

- 🎨 **Clean User Interface**  
  Built with Flutter Material 3 components and a simple, user-friendly design.

---

## 📱 Application Flow

```text
                    ┌─────────────────┐
                    │  Food Decider   │
                    └────────┬────────┘
                             │
                    Select Food Category
                             │
                             ▼
                    ┌─────────────────┐
                    │  Decide for Me  │
                    │       🎲        │
                    └────────┬────────┘
                             │
                             ▼
                    Random Food Selected
                             │
              ┌──────────────┼──────────────┐
              ▼              ▼              ▼
          ❤️ Favorite    📜 History     🔀 No Repeat