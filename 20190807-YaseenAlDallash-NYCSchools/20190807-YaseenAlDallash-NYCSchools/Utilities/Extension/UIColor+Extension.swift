//
//  UIColor+Extension.swift
//  YourBank
//
//  Created by Yaseen Al Dallash on 8/7/19.
//  Copyright © 2019 Yaseen Al Dallash. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()

        Scanner(string: hex).scanHexInt32(&int)
        
        let a, r, g, b: UInt32
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255,
                  green: CGFloat(g) / 255,
                  blue: CGFloat(b) / 255,
                  alpha: CGFloat(a) / 255)
    }
}


