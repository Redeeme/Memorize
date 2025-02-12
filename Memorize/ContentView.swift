//
//  ContentView.swift
//  Memorize
//
//  Created by Jozef Forgac on 11/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {	
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MyView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.brown)
        }
        .padding()
    }
}

#Preview {
    HStack{
        VStack {
            HStack{
                MyView()
                MyView()
            }
            HStack{
                MyView()
                MyView()
            }
            HStack{
                MyView()
                MyView()
            }
            HStack{
                MyView()
                MyView()
            }
        }
        VStack {
            HStack{
                MyView()
                MyView()
            }
            HStack{
                MyView()
                MyView()
            }
            HStack{
                MyView()
                MyView()
            }
            HStack{
                MyView()
                MyView()
            }
        }
    }
}
