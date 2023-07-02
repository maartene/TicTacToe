//
//  GameBoard.swift
//  
//
//  Created by Maarten Engels on 02/07/2023.
//

import Foundation

final class GameBoard {
    var cells = Array(repeating: "-", count: 9)
    
    var outputString: String {
        """
        Game Board Creation...
         | |
        -+-+-
         | |
        -+-+-
         | |
        
        Board Created.
        The game will start with player X
        """
    }
}
