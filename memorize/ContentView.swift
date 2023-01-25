//
//  ContentView.swift
//  memorize
//
//  Created by Ahmed Ezz on 16/01/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var memoryGameViewModel: MemoryGameViewModel
    @State var count = 10
    var body: some View {
        VStack
        {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65.0))]) {
                    ForEach(memoryGameViewModel.cards) { card in
                        CardView(card: card).aspectRatio(3/4, contentMode: .fit).onTapGesture {
                            memoryGameViewModel.choose(card: card)
                        }
                    }
                }}
            Spacer()
            HStack {
                RemoveButton
                Spacer()
                AddButton
            }
        }.padding([.top],60.0).padding(.horizontal)
        
    }
    var RemoveButton : some View
    {
        Button {
            count-=1
        } label: {
            Image("minus")
                .resizable()
                .frame(width: 50.0, height: 50.0)
        }.padding(5.0)
    }
    var AddButton : some View
    {
        Button {
            count+=1
        } label: {
            Image("plus")
                .resizable()
                .frame(width: 50.0, height: 50.0)
        }.padding(5.0).foregroundColor(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(memoryGameViewModel: MemoryGameViewModel()).previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
    }
}

struct CardView : View {
    
    var card: MemoryGame<String>.Card
    var body : some View {
        if card.isFaceUp && !card.isMatch {
            FaceUpCardView(cardText: card.content)
        } else if card.isFaceUp && card.isMatch {
            FaceUpCardView(cardText: card.content).opacity(0.5)
        }
        else {
            FaceDownCardView()
        }
    }
}
let shape = RoundedRectangle(cornerRadius: 25.0)
struct FaceUpCardView : View
{
    var cardText : String
    var body: some View
    {
        ZStack {
            shape.fill().foregroundColor(Color.brown)
            shape.strokeBorder(lineWidth: 2.0).foregroundColor(Color.red)
            Text(cardText).font(.largeTitle)
        }
    }
}
struct FaceDownCardView : View
{
    var body: some View
    {
        shape.foregroundColor(Color.blue)
    }
}
