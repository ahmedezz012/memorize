//
//  ContentView.swift
//  memorize
//
//  Created by Ahmed Ezz on 16/01/2023.
//

import SwiftUI

struct ContentView: View {
    var emojis : [String] = ["🐬","🐳","🐋","🦈","🦑",
         "🦐","🦞","🦀","🐟","🐙",
         "🦭","🦧","🐊","🦜","🐏",
         "🐘","🦓","🦏","🦚","🦉"]
    @State var count = 10
    var body: some View {
        VStack
        {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65.0))]) {
                    ForEach(emojis[0..<count], id : \.self) { it in CardView(cardText: it).aspectRatio(3/4, contentMode: .fit)
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
        ContentView()
    }
}

struct CardView : View
{
    var cardText : String
    @State var isFaceUp : Bool = false
    var body : some View {
        if isFaceUp {
            FaceUpCardView(cardText: cardText).onTapGesture {
                isFaceUp = false
            }
        }
        else {
            FaceDownCardView().onTapGesture {
                isFaceUp = true
            }
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
            shape.stroke(lineWidth: 2.0).foregroundColor(Color.red)
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
