//
//  AssignmentView.swift
//  memorize
//
//  Created by Ahmed Ezz on 20/01/2023.
//

import SwiftUI

struct AssignmentScreen: View {
    
    let minimum: CGFloat = 85.0
    
    let aspectRatio: CGFloat = 2/2.5
    
    let vehicleTab = 3
    
    let animalsTab = 2
    
    let birdsTab = 1
    
    let appTitle = "Memorize!"
    
    var vechichlesEmoji: [String] = [
        "🛵","🏍️","🛺",
        "🚔","🚍","🚘",
        "🛩️","✈️","🚁"
    ]
    
    var animalsEmoji: [String] = [
        "🐘","🦓","🦏",
        "🦧","🐊","🐏",
        "🦬","🦍","🐅"
    ]
    
    var birdsEmoji: [String] = [
        "🦆","🦅","🦉",
        "🐓","🦃","🦚",
        "🦤","🦩","🦢"
    ]
    
    @State var selectedSetOfEmoji: Array<String> = [
        "🦆","🦅","🦉",
        "🐓","🦃","🦚",
        "🦤","🦩","🦢"
    ]
    
    @State var currentSelected = 1
    
    var body: some View {
        return VStack {
            title
            listOfEmojis
            buttons
        }.padding(.horizontal, 10.0)
    }
    
    var listOfEmojis : some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minimum))]) {
                ForEach(selectedSetOfEmoji, id: \.self) { emoji in
                     CardView(cardIcon: emoji).aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    var buttons : some View {
        HStack {
            birdsButton
            Spacer()
            animalsButton
            Spacer()
            vehiclesButton
        }
    }
    var title : some View {
        Text(appTitle)
        .font(.title)
    }
    var birdsButton : some View {
        Button {
            selectedSetOfEmoji = birdsEmoji
            selectedSetOfEmoji.shuffle()
            currentSelected = birdsTab
        } label: {
            ButtonText(imageId: "bird",
                       text: "birds",
                       isSelected: currentSelected == birdsTab)
        }
    }
    
    var animalsButton : some View {
        Button {
            selectedSetOfEmoji = animalsEmoji
            selectedSetOfEmoji.shuffle()
            currentSelected = animalsTab
        } label: {
            ButtonText(imageId: "teddybear",
                       text: "animals",
                       isSelected: currentSelected == animalsTab)
        }
    }
    var vehiclesButton : some View {
        Button {
            selectedSetOfEmoji = vechichlesEmoji
            selectedSetOfEmoji.shuffle()
            currentSelected = vehicleTab
        } label: {
           ButtonText(imageId: "car",
                      text: "vehicles",
                      isSelected: currentSelected == vehicleTab)
        }
    }}

struct AssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentScreen()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 pro")

//        AssignmentView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
//            .previewDisplayName("iPhone 14 Pro Max")
//
//        AssignmentView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
//            .previewDisplayName("13 mini")
    }
}
