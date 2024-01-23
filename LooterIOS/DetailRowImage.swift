//
//  DetailRowImage.swift
//  LooterIOS
//
//  Created by Arthur LE-DEVEDEC on 1/23/24.
//

import Foundation
import SwiftUI

struct DetailRowImage: View {
    let item: LootItem
    @State private var rotate = false
    @State private var shadowed = false
    @State private var flipped = false
    @State private var shouldShowList = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color(item.rarity.getColor()))
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .shadow(color: Color(item.rarity.getColor()), radius: shadowed ? 100 : 0)
                .overlay(
                    Text(item.type.getLogo())
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                )
                .padding(.bottom, 20)
                .rotation3DEffect(
                    Angle(degrees: rotate ? 0 : 360),
                    axis: (x: -1, y: -0.5, z: 0)
                )
                .onAppear() {
                    Task {
                        withAnimation(Animation.linear) {
                            self.rotate.toggle()
                        }
                        try await Task.sleep(nanoseconds: 200_000_000)
                        withAnimation(Animation.spring()) {
                            self.shadowed.toggle()
                        }
                    }
                }
                .onTapGesture {
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.flipped.toggle()
                    }
                }
                .rotation3DEffect(
                    Angle(degrees: flipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
        }
        if item.rarity == .unique
        {
            Rectangle()
                .fill(Color(item.rarity.getColor()))
                .frame(width: 350, height: 50)
                .cornerRadius(20)
                .shadow(color: Color(item.rarity.getColor()), radius: 40)
                .overlay(
                    Text("Objet Unique")
                        .font(.headline)
                        .foregroundColor(.white)
                )
            Spacer()
                .frame(height: 100)
        }
    }
}
