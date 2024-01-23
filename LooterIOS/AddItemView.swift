//
//  AddItemView.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/19/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var inventory: Inventory
    @State var name : String = ""
    @State var rarity : Rarity = Rarity.common
    @State var quantity : Int = 1
    @State var game : Game = availableGames[0]
    @State var type : ItemType = .ring
    @State var attackItem : Bool = false
    @State var attackStrength : Int?
    
    
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section{
                Picker("Jeu", selection: $game) {
                    ForEach(availableGames, id: \.self) { game in
                        Text(game.name.capitalized)
                            .tag(game)
                    }
                    
                }
                
                Stepper(value: $quantity, in: 1...100) {
                    Text("Quantité : \(quantity)")
                }
            }
            
            Section{
                HStack {
                    Text("Type : ")
                    Spacer()
                    Text(type.getLogo())
                }
                Picker("Type", selection: $type) {
                    ForEach(ItemType.allCases, id: \.self) { selectedType in
                        Text(selectedType.getLogo())
                            .tag(selectedType)
                    }
                    
                }
                .pickerStyle(PalettePickerStyle())
            }
            
            Section {
                Toggle(isOn: $attackItem) {
                    Text("Objet d'attaque")
                }
                
                
                if attackItem {
                    Stepper("Force d'attaque : \(attackStrength ?? 0)", value: Binding<Int>(
                        get: { self.attackStrength ?? 0 },
                        set: { self.attackStrength = $0 }
                    ), in: 0...100)
                }
            }
            
            Button(action: {
                addItem()
                dismiss()
            }, label: {
                Text("Ajouter")
            })
        }
    }
    func addItem() {
        inventory.addItem(item: LootItem(
            quantity: quantity,
            name: name,
            type: type,
            rarity: rarity,
            attackStrength: attackStrength,
            game: game
        )
        )
        dismiss()
    }
}





#Preview {
    AddItemView(name: "", rarity: Rarity.common,quantity: 1)
}
