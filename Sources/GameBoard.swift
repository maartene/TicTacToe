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
        case started
        case playerXWon
        case playerOWon
        case draw
        
        var headerString: String {
            switch self {
            case .started:
                return "Game Board Creation...\n"
            case .playerXWon:
                return "Player X:\n"
            case .playerOWon:
                return "Player O:\n"
            case .draw:
                return "Player X:\n"
            }
        }
        
        var endString: String {
            switch self {
            case .started:
            return
                "Board Created.\n" +
                "The game will start with player X\n"
            case .playerXWon:
            return "PLAYER X WON!\n"
            case .playerOWon:
            return "PLAYER O WON!\n"
            case .draw:
            return "THE GAME ENDS WITH A DRAW!\n"
            }
        }
    }
    
    var state = GameState.started
    
    var cells = Array(repeating: Cell.empty, count: 9)
    
    var boardStateString: String {
        "\(cells[0])|\(cells[1])|\(cells[2])\n" +
        "-+-+-\n" +
        "\(cells[3])|\(cells[4])|\(cells[5])\n" +
        "-+-+-\n" +
        "\(cells[6])|\(cells[7])|\(cells[8])\n"
    }
    
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
    
    var outputString: String {
        state.headerString +
        boardStateString +
        "\n" +
        state.endString
    }
    
    var movesAvailable: Bool {
        cells.filter { cell in
            cell == .empty
        }.count > 0
    }
}

