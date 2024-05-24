//
//  BhagvadGita_SwiftUIApp.swift
//  BhagvadGita SwiftUI
//
//  Created by GHEEWALA DHARA on 24/05/24.
//

import SwiftUI

@main
struct BhagvadGita_SwiftUIApp: App {
    
    @State private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            MainView(isActive: $isActive)
        }
    }
}

struct MainView: View{
    @Binding var isActive: Bool
    
    var body: some View{
        Group{
            if isActive{
                ContentView()
            }else{
                HomePage()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                            withAnimation(Animation.easeInOut(duration: 1)) {
                                self.isActive = true         
                            }
                        }
                    }
            }
        }
    }
}
