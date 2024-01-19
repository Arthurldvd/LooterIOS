//
//  LootDetailView.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    @State var item: LootItem

    var body: some View {
        
        Section{
            
        }
        VStack {
    
            VStack {
                Rectangle()
                    .fill(Color(item.rarity.getColor()))
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                    .shadow(color: Color(item.rarity.getColor()), radius: 40)
                    .overlay(
                        Text(item.type.getLogo())
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                    )
            }
            .padding(.bottom, 20)

            VStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(item.rarity.getColor()))
                    .frame(width: 350, height: 50)
                    .cornerRadius(20)
                    .shadow(color: Color(item.rarity.getColor()), radius: 40)
                    .overlay(
                        Text("Item Unique")
                            .font(.headline)
                            .foregroundColor(.white)
                    )

                Text(item.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                Text("Type: \(item.type.getLogo())")
                    .font(.headline)

                Text("Rareté: \(String(describing: item.rarity))")
                    .font(.headline)

                Text("Quantité: \(item.quantity)")
                    .font(.headline)

                if let attackStrength = item.attackStrength {
                    Text("Force d'attaque: \(attackStrength)")
                        .font(.headline)
                }

                Text("Jeu: \(item.game.name)")
                    .font(.headline)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Détails de l'objet", displayMode: .inline)
    }
}

