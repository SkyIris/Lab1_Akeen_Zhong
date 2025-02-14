//
//  ContentView.swift
//  Lab1_Akeen_Zhong
//
//  Created by Akeen on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    //@State private var currentDate = Date.now
        
    var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    /*@ObservedObject var stopWatch = stopwatch()
    class stopwatch: ObservableObject{
        @Published var counter: Int = 0
        var timer = Timer()
        func start(){
            self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in self.counter+=1}
            
        }
        func reset(){
            self.counter = 0
        }
    }*/
    @State private var showAlert = false
    @State var score = 0
    @State var wrong = 0
    @State var number = Int.random(in: 1..<100)
    @State private var primes = [2,3,5,7,11,13,17,19,23,29,31,41,43,53,59,61,67,71,73,79,83,89,97]
    
    func correctAnswer(){
        score+=1
        //display asset, return
    }
    
    func wrongAnswer(){
        wrong+=1
        //display asset, return
    }
    

    
    var body: some View {
        VStack (spacing:50) {
            Spacer()
            Text("Prime number guessing game")
            Text("Current number: \(number)").onReceive(timer){
                input in self.newQuestion()
            }
            Spacer()
            ZStack{
                Color.green
                Button("Prime"){
                    showAlert = true
                    if (primes.contains(number)){
                        score+=1
                    }
                    else{
                        wrong+=1
                    }
                    newQuestion()
                }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                
            }
            ZStack{
                Color.red
                Button("Not prime"){
                    if (primes.contains(number)){
                        wrong+=1
                    }
                    else{
                        score+=1
                    }
                    newQuestion()
                }.buttonStyle(.borderedProminent)
                    .controlSize(.large)
            }
        }
        Spacer()
        Spacer()
        
        VStack(alignment: .leading){
            Text("Score: \(score) - \(wrong)")
        }
        .padding()
    }
    func newQuestion(){
        number = Int.random(in: 1..<100)
        var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    }
}

#Preview {
    ContentView()
}
