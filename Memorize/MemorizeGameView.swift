//
//  ContentView.swift
//  Memorize
//
//  Created by Jozef Forgac on 11/02/2025.
//

import SwiftUI

struct MemorizeGameView: View {
    @ObservedObject var viewModel: MemorizeEmojiGame

    var body: some View {
        VStack{
            cards
                .animation(.default,value: viewModel.getCards())
            Spacer()
            Button("Shuffle"){
                viewModel.shuffleCards()
            }
        }
    }
    
    var cards: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100),spacing: 0)],spacing: 0)
            {
                ForEach(viewModel.getCards()) { card in
                    CardView(card)
                        .aspectRatio(2/3,contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                        
                }
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25.0).stroke(lineWidth: 2).fill(Color.blue)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1)
                    .aspectRatio(1,contentMode: .fit)
                
                RoundedRectangle(cornerRadius: 25.0).fill(.blue).opacity((card.isFaceup || card.isMatched) ? 0 : 1)

            }
            Text("\(card.isMatched)")
        }

    }
}

#Preview {
    MemorizeGameView(viewModel: MemorizeEmojiGame())
}
