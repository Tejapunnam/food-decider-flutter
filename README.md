# 🍽️ Food Decider

> A simple and interactive Flutter application that helps you decide what to eat when you can't choose.

Food Decider removes the stress of choosing a meal by allowing users to select a food category and randomly generate a food recommendation with a single tap.

---

## 🚀 Live Demo

👉 **[Open Food Decider Live Demo](https://tejapunnam.github.io/food-decider-flutter/)**

Try the application directly in your browser without installing anything.

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
              │              │              │
              └──────────────┼──────────────┘
                             │
                             ▼
                    ⚙️ Settings / My Foods
## Experiment 1: Dart Programming Basics

### Aim
To understand the basic concepts of the Dart programming language and apply them to the Food Decider project.

### Concepts Implemented

- Variables and data types
- Arithmetic operators
- Conditional statements
- Lists
- For loop
- Functions
- List operations

### Implementation

A Dart program was created in
`lib/experiments/experiment_01_dart_basics.dart`.

The program demonstrates food details, price calculation, food availability checking, displaying a food menu, selecting a food item using a function, and updating the food list.

### Source Code

![Experiment 1 Source Code](screenshots/experiment_01/experiment_01_code.png)

### Output

![Experiment 1 Output](screenshots/experiment_01/experiment_01_output.png)
