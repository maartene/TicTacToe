import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    func test_exampleTest() {
        print("Hello, Tests!")
        XCTAssert(true)
    }
    
    func test_gameBoard_creation() {
        let gameBoard = GameBoard()
        
        let comparisonString = """
        Game Board Creation...
         | |
        -+-+-
         | |
        -+-+-
         | |
        
        Board Created.
        The game will start with player X
        """
        XCTAssertEqual(gameBoard.outputString, comparisonString)
    }
}
