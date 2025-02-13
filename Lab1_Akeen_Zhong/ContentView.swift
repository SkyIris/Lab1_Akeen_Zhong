//
//  ContentView.swift
//  Lab1_Akeen_Zhong
//
//  Created by Akeen on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Prime: \(score)"){
                score+=1
            }
            
            Button("Not prime:  \(score)"){
                score+=1
                   }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
