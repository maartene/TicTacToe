// The Swift Programming Language
// https://docs.swift.org/swift-book

let board = GameBoard()
print(board.outputString)
board.currentPlayer = .cross

while board.state == .inProgress {
    board.placeRandom()
}
