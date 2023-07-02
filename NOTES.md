# NOTES.md

## Pom 0:
### Requirement 1 - Game Board Creation phase 
RED/GREEN/REFACTOR

### Requirement 2 – Player X won with a vertical line
RED
* The board state is stored as an array with 9 items. Available values for the array items are: " ", "X" and "O"
* Had to change the way the comparison string and outputstring are defined to concatenate smaller strings. Reason: when using the """ string definition, trailing spaces are automatically removed. So I could no longer define empty spaces.

## Pom 1:
### Requirement 2 – Player X won with a vertical line continued
RED/GREEN/REFACTOR
* The output is now based on the game state
* Gamestate can change based on whether player X won
* Converted the player definition as a string to a domain specific representation

### Requirement 3 – Player O won with a horizontal line
RED
* Added failing test.
* Started implementing code to check for a win for player O and for horizontal wins.

## Pom 2:
### Requirement 3 – Player O won with a horizontal line
RED/GREEN/REFACTOR
* Test passes
* Refactored local variables to use domain specific naming (rows, columns)

### Requirement 4 - Player X won with a diagonal line
RED/GREEN/REFACTOR
* Test passes for player X with diagonal starting at cell 0
* Added test for Player O with diagnoal starting at cell 2 (opposite direction) - test passes
* Didn't refactor any code here

### Requirement 5 – The game ends with a draw
RED/GREEN
* To determine if we have a draw, we need to check if there are any legal moves available == cells that are empty.
* Started to refactor code so we can keep track of which player is the current player. This fails many tests, because currentplayer is not set.

## Pom 3:
### Requirement 5 – The game ends with a draw
RED/GREEN/REFACTOR
* Keep track of current player.

### Create a bot
* Bot selects a random cell from the available cells

### Create an app
* main.swift contains a very simple implementation.
* currentplayer is set from the main.swift app. This violates encapsulation (this should be the bots job). 
* This is difficult to fix without side effects. 
* But, there is still some time, to improve this.
