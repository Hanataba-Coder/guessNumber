//
//  NumberManager.swift
//  guessNumber
//
//  Created by Hanataba on 18/11/2562 BE.
//  Copyright © 2562 Hanataba. All rights reserved.
//

import Foundation

struct NumberManager {
    var fourDigit: String
    
    func convertToArray() {
        let digits = fourDigit.digits
        print(digits)
    }
}

extension StringProtocol  {
    var digits: [Int] {
        return compactMap{ $0.wholeNumberValue }
    }
}
