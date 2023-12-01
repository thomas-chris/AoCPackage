//
//  File.swift
//  
//
//  Created by Chris Thomas on 01/12/2023.
//

import Foundation

public extension Int {
    init?(_ character: Character) {
        self.init(String(character))
    }
}
