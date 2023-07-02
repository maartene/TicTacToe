//
//  GameBoard.swift
//  
//
//  Created by Maarten Engels on 02/07/2023.
//

import Foundation

final class GameBoard {
    enum GameState {
        case started
        case playerXWon
        
        var headerString: String {
            switch self {
            case .started:
                return "Game Board Creation...\n"
            case .playerXWon:
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
            }
        }
    }
    
    var state = GameState.started
    
    var cells = Array(repeating: " ", count: 9)
    
    var boardStateString: String {
        "\(cells[0])|\(cells[1])|\(cells[2])\n" +
        "-+-+-\n" +
        "\(cells[3])|\(cells[4])|\(cells[5])\n" +
        "-+-+-\n" +
        "\(cells[6])|\(cells[7])|\(cells[8])\n"
    }
    
    func determineState() {
        if checkForWin(for: "X") {
            state = .playerXWon
        }
    }
    
    private func checkForWin(for player: String) -> Bool {
        if checkForVerticalWin(for: player) {
            return true
        }
        
        return false
    }
    
    private func checkForVerticalWin(for player: String) -> Bool {
        for i in 0 ..< 3 {
            if cells[i] == player && cells[i + 3] == player && cells[i + 6] == player {
                return true
            }
        }
        return false
    }
    
    var outputString: String {
        state.headerString +
        boardStateString +
        "\n" +
        state.endString
    }
}

