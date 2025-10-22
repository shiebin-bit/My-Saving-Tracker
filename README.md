# My Saving Tracker

A utility app built with Flutter to calculate the time required to reach a savings goal. This project was developed for a lab assignment to demonstrate a solid understanding of fundamental Flutter concepts.

The application allows users to input a target savings amount, their starting balance and a recurring saving amount. Users can specify whether they are saving weekly or monthly. The app then calculates and clearly displays the total time needed to achieve the financial goal.

## Inputs → Process → Output

- **Input**  
  - Target Amount: The total amount of money user wants to save.
  - Starting Balance: The amount of money user has already saved.
  - Saving Amount: The amount user will save per period
  - Frequency: The saving period, either 'Weekly' or 'Monthly'.
- **Process**: The app calculates the number of periods needed using the formula
  - 'Periods = (Target Amount – Starting Balance) / Saving Amount'
- **Output**: The app displays the total number of weeks or months required to reach the goal by rounded to one decimal place.

## Widget List used

- Scaffold
- AppBar
- Column and Row
- Container
- Text
- TextField
- DropDownButton
- ElevatedButton
- SizedBox

## Basic Validation Approach

The app handles invalid inputs gracefully before performing any calculations. It uses a series of checks to ensure the data is logical such as It verifies that the Saving Amount and target amount must be a positive number (greater than zero). It also checks that the Target Amount is greater than the Starting Balance. Therefore, If any of these checks fail, the calculation is stopped and a user-friendly error message is displayed in the result area.
