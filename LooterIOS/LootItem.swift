//
//  LootItem.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/19/24.
//

import Foundation


import Foundation
import SwiftUI

struct LootItem : Identifiable, Hashable {
    var id = UUID()
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game

    
    
}
enum ItemType: CaseIterable {
    case magic
    case fire
    case ice
    case wind
    case poison
    case thunder
    case dagger
    case shield
    case bow
    case ring
    case unknown

    func getLogo() -> String {
        switch self {
        case .magic: return "⭐️"
        case .fire: return "🔥"
        case .ice: return "❄️"
        case .wind: return "💨"
        case .poison: return "☠️"
        case .thunder: return "⚡️"
        case .dagger: return "🗡️"
        case .shield: return "🛡️"
        case .bow: return "🏹"
        case .ring: return "💍"
        case .unknown: return "🎲"
        }
    }
}
    
var items = [
    LootItem(name: "Épée de feu", type: .fire, rarity: .rare, attackStrength: 50, game: availableGames[0]),
    LootItem(name: "Bouclier de glace", type: .ice, rarity: .common, attackStrength: 20, game: availableGames[1]),
    LootItem(name: "Arc du vent", type: .wind, rarity: .legendary, game: availableGames[2]),
]
