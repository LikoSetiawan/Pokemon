//
//  TypeColor.swift
//  Pokemon
//
//  Created by Liko Setiawan on 02/05/24.
//

import SwiftUI


let typeColors: [String: Color] = [
    "normal": Color(hex: 0xA8A77A),
    "fire": Color(hex: 0xEE8130),
    "water": Color(hex: 0x6390F0),
    "electric": Color(hex: 0xF7D02C),
    "grass": Color(hex: 0x7AC74C),
    "ice": Color(hex: 0x96D9D6),
    "fighting": Color(hex: 0xC22E28),
    "poison": Color(hex: 0xA33EA1),
    "ground": Color(hex: 0xE2BF65),
    "flying": Color(hex: 0xA98FF3),
    "psychic": Color(hex: 0xF95587),
    "bug": Color(hex: 0xA6B91A),
    "rock": Color(hex: 0xB6A136),
    "ghost": Color(hex: 0x735797),
    "dragon": Color(hex: 0x6F35FC),
    "dark": Color(hex: 0x705746),
    "steel": Color(hex: 0xB7B7CE),
    "fairy": Color(hex: 0xD685AD)
]



extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
