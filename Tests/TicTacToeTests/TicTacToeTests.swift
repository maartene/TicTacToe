import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    private func cellsAsStringToCells(_ stringCells: [String]) -> [GameBoard.Cell] {
        stringCells.map { stringCell in
            switch stringCell {
            case "X":
                return .cross
            case "O":
                return .nought
            default:
                return .empty
            }
        }
    }
    
    func test_exampleTest() {
        print("Hello, Tests!")
        XCTAssert(true)
    }
    
    func test_gameBoard_creation() {
        let gameBoard = GameBoard()
        
        let comparisonString =
            "Game Board Creation...\n" +
            " | | \n" +
            "-+-+-\n" +
            " | | \n" +
            "-+-+-\n" +
            " | | \n" +
            "\n" +
            "Board Created.\n" +
            "The game will start with player X\n"
        
        XCTAssertEqual(gameBoard.outputString, comparisonString)
    }
    
    func test_playerX_won_withVerticalLine() {
        let gameBoard = GameBoard()
        gameBoard.cells = cellsAsStringToCells([
            "X"," "," ",
            "X","O"," ",
            "X"," ","O"
        ])
        
        gameBoard.determineState()
        
        let comparisonString =
        "Player X:\n" +
        "X| | \n" +
        "-+-+-\n" +
        "X|O| \n" +
        "-+-+-\n" +
        "X| |O\n" +
        "\n" +
        "PLAYER X WON!\n"
        
        
        XCTAssertEqual(gameBoard.outputString, comparisonString)
    }
    
    func test_playerO_won_withHorizontalLine() {
        let gameBoard = GameBoard()
        gameBoard.cells = cellsAsStringToCells([
            "X"," ","X",
            "O","O","O",
            "X"," "," "
        ])
        
        gameBoard.determineState()
        
        let comparisonString =
        "Player O:\n" +
        "X| |X\n" +
        "-+-+-\n" +
        "O|O|O\n" +
        "-+-+-\n" +
        "X| | \n" +
        "\n" +
        "PLAYER O WON!\n"
        
        
        XCTAssertEqual(gameBoard.outputString, comparisonString)
    }
    
    func test_playerX_won_withDiagonalLine() {
        let gameBoard = GameBoard()
        gameBoard.cells = cellsAsStringToCells([
            "X"," "," ",
            "O","X"," ",
            "O"," ","X"
        ])
        
        gameBoard.determineState()
        
        let comparisonString =
        "Player X:\n" +
        "X| | \n" +
        "-+-+-\n" +
        "O|X| \n" +
        "-+-+-\n" +
        "O| |X\n" +
        "\n" +
        "PLAYER X WON!\n"
        
        
        XCTAssertEqual(gameBoard.outputString, comparisonString)
    }
    
    func test_playerO_won_withDiagonalLine_inOtherDirection() {
        let gameBoard = GameBoard()
        gameBoard.cells = cellsAsStringToCells([
            "X"," ","O",
            "X","O"," ",
            "O"," "," "
        ])
        
        gameBoard.determineState()
        
        let comparisonString =
        "Player O:\n" +
        "X| |O\n" +
        "-+-+-\n" +
        "X|O| \n" +
        "-+-+-\n" +
        "O| | \n" +
        "\n" +
        "PLAYER O WON!\n"
        
        XCTAssertEqual(gameBoard.outputString, comparisonString)
    }
    
    func test_draw_whenNoMoreLegalMovesAreAvailable() {
        let gameBoard = GameBoard()
        gameBoard.cells = cellsAsStringToCells([
            "X","O","X",
            "O","O","X",
            "X","X","O"
        ])
        
        gameBoard.determineState()
        
        let comparisonString =
        "Player X:\n" +
        "X|O|X\n" +
        "-+-+-\n" +
        "O|O|X\n" +
        "-+-+-\n" +
        "X|X|O\n" +
        "\n" +
        "THE GAME ENDS WITH A DRAW!\n"
        
        XCTAssertEqual(gameBoard.outputString, comparisonString)
    }
}
