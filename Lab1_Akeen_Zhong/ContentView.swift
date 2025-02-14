//
//  ContentView.swift
//  Lab1_Akeen_Zhong
//
//  Created by Akeen on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var wrong = 0
    @State var number = Int.random(in: 1..<100)
    let primes = [2,3,5,7,11,13,17,19,23,29,31,41,43,53,59,61,67,71,73,79,83,89,97]
    var body: some View {
        VStack (spacing:20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Current number: \(number)")
            Spacer()
            ZStack{
                Color.black
                Button("Prime"){
                    if (primes.contains(number)){
                        score+=1
                    }
                    else{
                        wrong+=1
                    }
                }
            }
            Spacer()
            ZStack{
                Color.red
                Button("Not prime"){
                    if (primes.contains(number)){
                        wrong+=1
                    }
                    else{
                        score+=1
                    }
                }
            }
        }
        Spacer()
        Spacer()
        
        VStack(alignment: .leading){
            Text("Score: \(score) - \(wrong)")
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
