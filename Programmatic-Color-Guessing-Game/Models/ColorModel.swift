//
//  ColorModel.swift
//  Programmatic-Color-Guessing-Game
//
//  Created by Liana Norman on 10/10/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation
import UIKit

struct RGB {
    var red = CGFloat.random(in: 0.0...1.0)
    var green = CGFloat.random(in: 0.0...1.0)
    var blue = CGFloat.random(in: 0.0...1.0)



func randomColor() -> UIColor {
    return UIColor(red: red,
                   green: green,
                   blue: blue,
                   alpha: 1.0)
}

    func findBiggestNumber() -> CGFloat {
       let arrOfColors = [red, green, blue]
        let filteredArr = arrOfColors.sorted(by: {$0 > $1})
        return filteredArr[0]
    }
    
    func highestColor() -> UIColor {
        let arrOfColors = [red, green, blue]
        let filteredArr = arrOfColors.sorted(by: {$0 > $1})
        switch filteredArr[0] {
        case red :
            return UIColor.red
        case blue :
            return UIColor.blue
        case green :
            return UIColor.green
        default :
            return UIColor.clear
        }
    }
}
