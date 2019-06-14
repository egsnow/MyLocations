//
//  String+AddText.swift
//  MyLocations
//
//  Created by Eric Snow on 5/25/19.
//  Copyright © 2019 Eric Snow. All rights reserved.

import Foundation

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text }
    }
}
