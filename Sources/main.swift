// The Swift Programming Language
// https://docs.swift.org/swift-book

let board = GameBoard()
print(board.outputString)
board.currentPlayer = .cross

while board.state == .inProgress {
    board.placeRandom(board.currentPlayer)
    board.determineState()
    print(board.outputString)
    board.currentPlayer = board.nextPlayer
}
