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
