//
//  AddItemView.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/19/24.
//

import SwiftUI

struct AddItemView: View {
    @Binding var name : String
    @Binding var rarity : Rarity
    
    var body: some View {
            Form {
            Section {
                    TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(String(describing: rarity).capitalized)
                        }
                    }
                    Button(action: {
                        
                    }, label: {
                        Text("Ajouter")
                    })
                }
            }
        }
}

enum Rarity : CaseIterable {
    case common,
    uncommon,
    rare,
    epic,
    legendary,
    unique
    var id: Self { self }
}

#Preview {
    AddItemView(name: .constant("namePreview"), rarity: .constant(.common))
}
