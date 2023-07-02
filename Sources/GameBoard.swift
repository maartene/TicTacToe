//
//  GameBoard.swift
//  
//
//  Created by Maarten Engels on 02/07/2023.
//

import Foundation

final class GameBoard {
    var cells = Array(repeating: " ", count: 9)
    
    var boardStateString: String {
        """
        \(cells[0])|\(cells[1])|\(cells[2])
        -+-+-
        \(cells[3])|\(cells[4])|\(cells[5])
        -+-+-
        \(cells[6])|\(cells[7])|\(cells[8])
        """
    }
    
    var outputString: String {
        "Game Board Creation...\n" +
        "\(cells[0])|\(cells[1])|\(cells[2])\n" +
        "-+-+-\n" +
        "\(cells[3])|\(cells[4])|\(cells[5])\n" +
        "-+-+-\n" +
        "\(cells[6])|\(cells[7])|\(cells[8])\n" +
        "\n" +
        "Board Created.\n" +
        "The game will start with player X\n"
    }
}

