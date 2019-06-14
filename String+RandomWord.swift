//
//  String+RandomWord.swift
//  MyLocations
//
//  Created by Eric Snow on 5/19/19.
//  Copyright © 2019 Eric Snow. All rights reserved.

import Foundation

extension String {
    func addRandomWord() -> String {
        let words = ["rabbit", "banana", "boat"]
        let value = Int.random(in: 0 ..< words.count)
        let word = words[value]
        return self + word
    }
}
