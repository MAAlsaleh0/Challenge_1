//
//  ColorModel.swift
//  Challenge_1
//
//  Created by Mohammed Alsaleh on 11/01/2024.
//

import Foundation
import SwiftUI

struct ColorModel : Identifiable {
    let id = UUID().uuidString
    var color: Color
    var colorName: String
    
    static let colors : [ColorModel] = [
        ColorModel(color: .red, colorName: "Red"),
        ColorModel(color: .green, colorName: "Green"),
        ColorModel(color: .blue, colorName: "Blue"),
        ColorModel(color: .yellow, colorName: "Yellow"),
        ColorModel(color: .orange, colorName: "Orange"),
        ColorModel(color: .purple, colorName: "Purple"),
        ColorModel(color: .pink, colorName: "Pink")
    ]
}
