import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
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
        gameBoard.cells = [
            "X"," "," ",
            "X","O"," ",
            "X"," ","O"
        ]
        
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
}
