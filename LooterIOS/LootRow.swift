//
//  LootRow.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/23/24.
//

import SwiftUI

struct ItemInfoView: View {
    let item: LootItem
    

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(item.rarity.getColor())
                    .frame(width: 12, height: 12)
                Text(item.name).font(.headline)
                Spacer()
                Text(item.type.getLogo())
            }
            Text("Quantité : \(item.quantity)")
        }
    }
}
