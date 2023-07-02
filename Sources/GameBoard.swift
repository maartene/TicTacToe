//
//  GameBoard.swift
//  
//
//  Created by Maarten Engels on 02/07/2023.
//

import Foundation

final class GameBoard {
    enum Cell: CustomStringConvertible {
        case cross
        case nought
        case empty
        
        var description: String {
            switch self {
            case .cross:
                return "X"
            case .nought:
                return "O"
            case .empty:
                return " "
            }
        }
    }
    
    enum GameState {
        case playerXWon
        case playerOWon
        case draw
        case inProgress
        
//        var headerString: String {
//            switch self {
//            case .inProgress:
//                return "Player "
//            case .playerXWon:
//                return "Player X:\n"
//            case .playerOWon:
//                return "Player O:\n"
//            case .draw:
//                return "Player X:\n"
//            }
//        }
        
        var endString: String {
            switch self {
            case .inProgress:
            return ""
            case .playerXWon:
            return "PLAYER X WON!\n"
            case .playerOWon:
            return "PLAYER O WON!\n"
            case .draw:
            return "THE GAME ENDS WITH A DRAW!\n"
            }
        }
    }
    
    var state = GameState.inProgress
    
    var cells = Array(repeating: Cell.empty, count: 9)
    
    var boardStateString: String {
        "\(cells[0])|\(cells[1])|\(cells[2])\n" +
        "-+-+-\n" +
        "\(cells[3])|\(cells[4])|\(cells[5])\n" +
        "-+-+-\n" +
        "\(cells[6])|\(cells[7])|\(cells[8])\n"
    }
    
    var currentPlayer: Cell = .empty
    
    func determineState() {
        if movesAvailable == false {
            state = .draw
        }
        
        if checkForWin(for: .cross) {
            state = .playerXWon
        }
        if checkForWin(for: .nought) {
            state = .playerOWon
        }
        
        
    }
    
    private func checkForWin(for player: Cell) -> Bool {
        if checkForVerticalWin(for: player) {
            return true
        }
        
        if checkForHorizontalWin(for: player) {
            return true
        }
        
        if checkForDiagonalWin(for: player) {
            return true
        }
            
        return false
    }
    
    private func checkForVerticalWin(for player: Cell) -> Bool {
        for column in 0 ..< 3 {
            if cells[column] == player && cells[column + 3] == player && cells[column + 6] == player {
                return true
            }
        }
        return false
    }
    
    private func checkForHorizontalWin(for player: Cell) -> Bool {
        for row in 0 ..< 3 {
            let rowIndex = row * 3
            if cells[rowIndex] == player && cells[rowIndex + 1] == player && cells[rowIndex + 2] == player {
                return true
            }
        }
        return false
    }
    
    private func checkForDiagonalWin(for player: Cell) -> Bool {
        (cells[0] == player && cells[4] == player && cells[8] == player) ||
        (cells[2] == player && cells[4] == player && cells[6] == player)
    }
    
    var headerString: String {
        switch currentPlayer {
        case .empty:
            return "Game Board Creation...\n"
        default:
            return "Player \(currentPlayer):\n"
        }
    }
    
    var endString: String {
        currentPlayer == .empty ? "Board Created.\nThe game will start with player X\n" : state.endString
    }
    
    var outputString: String {
        headerString +
        boardStateString +
        "\n" +
        endString
    }
    
    var movesAvailable: Bool {
        cells.filter { cell in
            cell == .empty
        }.count > 0
    }
    
    var availableMoves: [Int] {
        var result = [Int]()
        for i in 0 ..< cells.count {
            if cells[i] == .empty {
                result.append(i)
            }
        }
        return result
    }
    
    func placeRandom() {
        if let randomElement = availableMoves.randomElement() {
            cells[randomElement] = currentPlayer
        }
        
        determineState()
        print(outputString)
        currentPlayer = nextPlayer
    }
    
    var nextPlayer: Cell {
        switch currentPlayer {
        case .cross:
            return .nought
        default:
            return .cross
        }
    }
}

