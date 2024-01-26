import SwiftUI

@main
struct LooterIOSApp: App {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false

    var body: some Scene {
        WindowGroup {
            if isOnboardingDone {
                MainAppView(isOnboardingDone: $isOnboardingDone)
            } else {
                OnboardingView(isOnboardingDone: $isOnboardingDone)
            }
        }
    }
}

struct OnboardingPageView: View {
    var title: String
    var iconName: String
    var description: String
    var buttonText: String?
    var buttonAction: () -> Void
    var iconBackgroundColor: Color
    @Binding var isOnboardingDone: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding(30)
                .background(Circle().fill(iconBackgroundColor))
                .foregroundColor(.white)
            
            Text(description)
                .font(.body)
                .padding(30)
            
            if let buttonText = buttonText {
                Button(buttonText, action: buttonAction)
                    .padding()
                    .frame(width: 250, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
        }
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct OnboardingView: View {
    @Binding var isOnboardingDone: Bool
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingPageView(title: "Gérer ses loots", iconName: "gym.bag.fill", description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personelle.", buttonText: "Suivant", buttonAction: {
                selectedTab = 1
            }, iconBackgroundColor: .blue, isOnboardingDone: $isOnboardingDone)
            .tag(0)
            OnboardingPageView(title: "Votre wishlist", iconName: "wand.and.stars", description: "Créez une liste de souhaits pour garder une trace des articles que vous voulez acquérir", buttonText: "Suivant", buttonAction: {
                selectedTab = 2
            }, iconBackgroundColor: .purple, isOnboardingDone: $isOnboardingDone)
            .tag(1)
            OnboardingPageView(title: "En un coup d'oeil", iconName: "iphone.case", description: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil et votre appareil", buttonText: "Commencer", buttonAction: {
                isOnboardingDone = true
            }, iconBackgroundColor: .yellow, isOnboardingDone: $isOnboardingDone)
            .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct MainAppView: View {
    @Binding var isOnboardingDone: Bool
    var body: some View {
        ContentView(isOnboardingDone: $isOnboardingDone)
    }
}
