# 🍽️ Food Decider

> A simple and interactive Flutter application that helps you decide what to eat when you can't choose.

Food Decider removes the stress of choosing a meal by allowing users to select a food category and randomly generate a food recommendation with a single tap.

---

## 🚀 Live Demo

👉 **[Open Food Decider Live Demo](https://tejapunnam.github.io/food-decider-flutter/)**

Try the application directly in your browser without installing anything.

---
INSERT IMAGES 

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/3c3c6be3-5f1f-437f-a4f0-9ff8413bd423" />

<img width="1920" height="1080" alt="Screenshot (1001)" src="https://github.com/user-attachments/assets/ce2e6a27-f4d3-486a-a1c5-0809e0321925" />

<img width="1920" height="1080" alt="Screenshot (1000)" src="https://github.com/user-attachments/assets/3e8a2178-7ccf-4e77-9c40-e6a4defa37f6" />

<img width="1920" height="1080" alt="Screenshot (1030)" src="https://github.com/user-attachments/assets/0bca3e3f-5da8-415d-a9f3-dbbf96fa7280" />

<img width="1920" height="1080" alt="Screenshot (1002)" src="https://github.com/user-attachments/assets/ea5b32e1-ecb2-4f8e-aa40-26cda45aa1c0" />

<img width="1920" height="1080" alt="Screenshot (1031)" src="https://github.com/user-attachments/assets/0fddd384-245b-4062-81ff-4e34caad2085" />

<img width="1920" height="1080" alt="Screenshot (1003)" src="https://github.com/user-attachments/assets/0e6cc518-4395-4777-8f1f-10e81961d249" />



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
## Overview of Flutter Lab Experiments

The following experiments focus on learning Flutter application development, starting from basic widgets and gradually moving towards advanced concepts.

### Experiment 1: Dart Programming Basics
Introduces the fundamentals of Dart programming, including variables, data types, operators, conditional statements, loops, functions, and list operations. These concepts are used to implement basic food-related operations in the Food Decider application.

### Experiment 2: Flutter Widgets and Layouts
Explores basic Flutter widgets such as Text, Image, and Container. It also demonstrates how Row, Column, and Stack are used to arrange UI elements and create structured application layouts.

### Experiment 3: Responsive UI Design
Focuses on designing user interfaces that automatically adjust to different screen sizes. MediaQuery and breakpoints are used to create responsive layouts for mobile phones and other devices.

### Experiment 4: Navigation Between Screens
Demonstrates screen navigation using Flutter's Navigator class. Named routes are implemented to make navigation between different screens easier and more organized.

### Experiment 5: State Management
Introduces StatelessWidget and StatefulWidget to understand how Flutter manages UI changes. The setState method and Provider are used to update and manage application data dynamically.

### Experiment 6: Custom Widgets and Styling
Focuses on creating reusable custom widgets to maintain consistency throughout the application. Themes and custom styles are applied to improve the appearance and overall user experience.

### Experiment 7: Forms and Validation
Demonstrates how to create forms with different input fields. Form validation and error handling are implemented to ensure that users enter valid information.

### Experiment 8: Animations
Introduces Flutter's animation framework to make the application more interactive. Fade and slide animations are implemented to create smooth transitions and improve the user experience.

### Experiment 9: REST API Integration
Explores how to connect a Flutter application with external REST APIs. Data is fetched from a server, processed, and displayed meaningfully in the application interface.

### Experiment 10: Testing and Debugging
Focuses on testing Flutter application components using unit tests. Flutter debugging tools are used to identify errors, troubleshoot problems, and improve application reliability.
