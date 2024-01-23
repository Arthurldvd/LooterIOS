//
//  RarityEnum.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/19/24.
//

import Foundation
import SwiftUI

enum Rarity: CaseIterable {
    case common,
         uncommon,
         rare,
         epic,
         legendary,
         unique
         var id: Self { self }

    func getColor() -> Color {
        switch self {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.orange
        case .unique:
            return Color.red
        }
    }
}
