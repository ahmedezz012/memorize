//
//  Cards.swift
//  memorize
//
//  Created by Ahmed Ezz on 20/01/2023.
//

import SwiftUI

var roundedRect = RoundedRectangle(cornerRadius: 25.0)

struct FaceDownCardView : View {
    var body : some View {
        ZStack {
            roundedRect.fill().foregroundColor(Color.cyan)
        }
    }
}

struct FaceUpCardView : View {
    
    @State var cardIcon : String
    
    var body : some View {
        ZStack {
            roundedRect.fill().foregroundColor(Color.blue)
            roundedRect.strokeBorder(lineWidth: 3.0).foregroundColor(Color.red)
            Text(cardIcon).font(.largeTitle)
        }
    }
}
