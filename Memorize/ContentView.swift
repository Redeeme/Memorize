//
//  ContentView.swift
//  Memorize
//
//  Created by Jozef Forgac on 11/02/2025.
//

import SwiftUI

struct ContentView: View {
    let smileEmojis: [String] = ["😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "😋", "😎", "😌", "😍", "😘", "😗", "😙", "😚", "😋", "😜", "😝", "😛", "😜", "😒", "😞", "😔", "😕", "😟", "😤",]
    @State var emojisCount = 5
    let columns = [GridItem(.adaptive(minimum: 120))]
    
    
    var body: some View {
        VStack{
            cards
            Spacer()
            countChangers
        }
    }
    
    var cards: some View{
        ScrollView{
            LazyVGrid(columns: columns)
            {
                ForEach(0..<emojisCount, id: \.self) { index in
                    CardView(emoji: smileEmojis[index])
                        .aspectRatio(2/3,contentMode: .fit)
                }
            }.padding(5)
        }
    }
    
    var countChangers: some View{
        HStack{
            countChanger(by: 1, symbol: "plus.diamond",color: .green)
            Spacer()
            countChanger(by: -1, symbol: "minus.diamond",color: .red)
        }.padding(10).font(.largeTitle)
    }
    
    func countChanger(by offset: Int, symbol: String, color:Color)-> some View{
        Button(action: {
            emojisCount += offset
        }, label: {
            Image(systemName: symbol).tint(color)
        }).disabled(emojisCount + offset > smileEmojis.count || emojisCount + offset == 0)
    }
}

struct CardView: View {
    let emoji : String
    @State var isFaceUp: Bool = true
    

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0).stroke(lineWidth: 2).fill(Color.blue)
            Text(emoji)
            RoundedRectangle(cornerRadius: 25.0).opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
