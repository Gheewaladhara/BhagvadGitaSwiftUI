//
//  HomePage.swift
//  BhagvadGita SwiftUI
//
//  Created by GHEEWALA DHARA on 24/05/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        let darkBrown = Color(red: 101/255, green: 67/255, blue: 33/255)
        
        VStack{
            Image("bhagavadgita")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("श्रीमद्भगवदगीता")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(darkBrown)
        }
    }
}

#Preview {
    HomePage()
}
