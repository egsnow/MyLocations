//
//  Functions.swift
//  MyLocations
//
//  Created by Eric Snow on 4/7/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import Foundation


func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}



