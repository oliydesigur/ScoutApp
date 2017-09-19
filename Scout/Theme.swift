//
//  File.swift
//  Scout
//
//  Created by Stefan Olaru on 10/09/2017.
//  Copyright © 2017 Stefan Olaru. All rights reserved.
//

import Foundation
import UIKit

public protocol ThemeScheme {
    var colours: ColourScheme {get}
}

public struct Theme: ThemeScheme {
    public let colours: ColourScheme
    public init(colours: ColourScheme = Colours()){
        self.colours = colours
    }
}

public protocol ColourScheme {
    var primaryColor: UIColor {get} // default colour in scheme
    var textOnPrimaryColour: UIColor {get}
    
    var secondaryColor: UIColor {get} // ie. selected colour of controls
    
    var black: UIColor {get}
    var white: UIColor {get}
    
    var lightGrey: UIColor {get}
    var darkGrey: UIColor {get}
}

public struct Colours: ColourScheme {
    public let primaryColor = UIColor(red:102 / 255.0, green: 204 / 255.0, blue:255 / 255.0, alpha:1.00)
    public let textOnPrimaryColour = UIColor(red:0.85, green:0.92, blue:0.89, alpha:1.00)
    
    public let secondaryColor = UIColor(red:0.99, green:0.19, blue:0.35, alpha:1.00)
    
    public let black = UIColor(red:0.08, green:0.06, blue:0.13, alpha:1.00)
    public let white = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)
    
    public let lightGrey = UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.00)
    public let darkGrey = UIColor(red:0.56, green:0.56, blue:0.58, alpha:1.00)
}

