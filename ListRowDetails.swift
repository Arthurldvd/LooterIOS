//
//  ListRowDetails.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/23/24.
//

import Foundation
import SwiftUI

struct ListInfoView: View {
    let item: LootItem
    @State private var shouldShowList = false
    
    var body: some View {
        Section{
            HStack(){
                    Section() {
                        if let coverImage = UIImage(named: item.game.coverName!) {
                            Image(uiImage: coverImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 58)
                                .cornerRadius(4)
                        } else {
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [.gray]), startPoint: .top, endPoint: .bottom)
                                    .opacity(0.4)
                                    .cornerRadius(4)
                                
                                Image(systemName: "rectangle.slash")
                                    .foregroundColor(.black)
                                    .opacity(0.4)
                                    .padding()
                            }
                            .frame(width: 70, height: 58)
                        }
                        Text(item.game.name)
                        
                    }
                }
                
                Text("In-game : \(item.name)")
                    .font(.headline)
                    .padding(.vertical)
                
                if let attackStrength = item.attackStrength {
                    Text("Puissance (ATQ): \(attackStrength)")
                        .font(.headline)
                        .padding(.vertical)
                }
                else {
                    Text("Item défense")
                        .font(.headline)
                        .padding(.vertical)
                }
                
                
                Text("Possédé(s): \(item.quantity)")
                    .font(.headline)
                    .padding(.vertical)
                
                Text("Rareté: \(String(describing: item.rarity))")
                    .padding(.vertical)
        }
    header: {
        Text("INFORMATIONS")
    }
       
        }
    }
    


