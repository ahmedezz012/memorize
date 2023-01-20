//
//  AssignmentView.swift
//  memorize
//
//  Created by Ahmed Ezz on 20/01/2023.
//

import SwiftUI

struct AssignmentView: View {
    
    var vechichlesEmoji : [String] = ["🛵","🏍️","🛺",
                                      "🚔","🚍","🚘",
                                      "🛩️","✈️","🚁"]
    var animalsEmoji : [String] = ["🐘","🦓","🦏",
                                   "🦧","🐊","🐏","🦬","🦍","🐅"]
    var birdsEmoji : [String] = ["🦆","🦅","🦉",
                                 "🐓","🦃","🦚","🦤","🦩","🦢"]
    @State var selectedSetOfEmoji :Array<String> = ["🦆","🦅","🦉",
                                                    "🐓","🦃","🦚","🦤","🦩","🦢"]
    
    @State var currentSelected = 1
    var body: some View {
        
       return VStack{
           Title
           ListOfEmojis
           Buttons
        }.padding(.horizontal,10.0)
    }
    var ListOfEmojis : some View
    {
        ScrollView {
            LazyVGrid(columns :[GridItem(.adaptive(minimum: 85.0))]){
                ForEach(selectedSetOfEmoji[0..<9], id: \.self)
                {
                    it in CardView(cardIcon:it).aspectRatio(2/2.5, contentMode: .fit)
                }
            }}    }
    var Buttons : some View
    {
        HStack {
            BirdsButton
            Spacer()
            AnimalsButton
            Spacer()
            VehiclesButton
        }    }
    var Title : some View
    {
        Text("Memorize!")
            .font(.title)    }
    var BirdsButton : some View
    {
        Button {
            selectedSetOfEmoji = birdsEmoji
            selectedSetOfEmoji.shuffle()
            currentSelected = 1
        } label: {
            ButtonText(imageId: "bird", text: "birds",isSelected: currentSelected == 1)
        }
    }
    var AnimalsButton : some View
    {
        Button {
            selectedSetOfEmoji = animalsEmoji
            selectedSetOfEmoji.shuffle()
            currentSelected = 2
        } label: {
            ButtonText(imageId: "teddybear", text: "animals",isSelected: currentSelected == 2)
        }
    }
    var VehiclesButton : some View
    {
        Button {
            selectedSetOfEmoji = vechichlesEmoji
            selectedSetOfEmoji.shuffle()
            currentSelected = 3
        } label: {
            ButtonText(imageId: "car", text: "vehicles",isSelected: currentSelected == 3)
        }
    }}

struct AssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                    .previewDisplayName("iPhone 14")

        AssignmentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
                    .previewDisplayName("iPhone 14 Pro Max")
        
        AssignmentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
                    .previewDisplayName("13 mini")
    }
}
