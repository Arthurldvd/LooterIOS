import SwiftUI

struct LootDetailView: View {
    @State var item: LootItem
    @State private var rotate = false
    @State private var shadowed = false
    @State private var flipped = false
    @State private var shouldShowList = false
    
    var body: some View {
        Section {
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
            
            Spacer()
                .frame(height: 20)
            
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
        List {
            
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
        .transition(.opacity)
        .transition(.slide)
        .opacity(shouldShowList ? 1.0 : 0.0)
        .onAppear() {
            withAnimation(.easeInOut(duration: 0.9)) {
                shouldShowList = true
            }
        }
    }
}
