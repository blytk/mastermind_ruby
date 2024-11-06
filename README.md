 # Mastermind Ruby

A small Ruby project with the game **Mastermind**, created to run in the terminal.

## About the Game

Mastermind is a code-breaking game where players either guess a color code generated by the computer or create a color code for the computer to guess.

### How to Play

- The game involves six colors: **black**, **blue**, **green**, **red**, **white**, and **yellow**.
- The program enforces valid color choices, so players cannot select colors outside this set.
  
Players try to guess the code within a set number of attempts (12). After each guess, the game provides feedback through color-coded pins, which offer hints about the accuracy of the guess.

### Feedback Pins

After each guess attempt, **pins** will indicate how close the guess is:

- **Red Pin**: One of the guessed colors is in the correct position and matches a color in the code.
- **White Pin**: One of the guessed colors is in the code but is not in the correct position.
  
> **Note**: The order of the pins does not correspond to the positions of the guessed colors.

## How to Run

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Install bundler if not installed already: gem install bundler
4. Install required gems ("colorize") running the command: bundle install
5. ruby main.rb

