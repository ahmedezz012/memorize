//
//  CardView.swift
//  memorize
//
//  Created by Ahmed Ezz on 20/01/2023.
//

import SwiftUI

struct CardView: View
{
    @State var cardIcon : String
    @State var isFaceUp : Bool = !false
    var body: some View
    {
        if !isFaceUp
        {
            FaceDownCardView().onTapGesture {
                isFaceUp = true
            }
        } else
        {
            FaceUpCardView(cardIcon: cardIcon).onTapGesture {
                isFaceUp = false
            }
        }
    }
}
