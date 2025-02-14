//
//  ContentView.swift
//  Lab1_Akeen_Zhong
//
//  Created by Akeen on 2025-02-12.
//

import SwiftUI

struct ContentView: View {

        
    var timer = Timer.publish(every: 7, on: .main, in: .common).autoconnect()

    @State var showCheck = false
    @State var showX = false
    
    @State private var showAlert = false
    @State var score = 0
    @State var wrong = 0
    @State var number = Int.random(in: 1..<100)
    @State private var primes = [2,3,5,7,11,13,17,19,23,29,31,41,43,53,59,61,67,71,73,79,83,89,97]
    
    
    func timeOut(){
        wrong+=1
        showX = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            newQuestion()
        }

    }
    
    func correct(){
        score+=1
        showCheck = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            newQuestion()
        }
    }
    

    
    var body: some View {
        VStack (spacing:50) {
            Spacer()
            if((score+wrong) == 10)
            {
                Text("").alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Your score is \(score)/\(wrong)"))
                })
            }
            if(showX)
            {
                Image("redx")
                }
            
            if(showCheck)
            {
                Image("greencheck")
            }
            Text("Prime number guessing game").font(.system(size:28))
            Text("Current number: \(number)").onReceive(timer){
                input in self.timeOut()

            }.font(.system(size:28))
            Spacer()
            ZStack{
                Color.green
                Button("Prime"){
                    showAlert = true
                    if (primes.contains(number) && showX == false && showCheck == false){
                        correct()
                    }
                    else if(showX == false && showCheck == false){
                        timeOut()
                    }
                    
                }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                
            }
            
            ZStack{
                Color.red
                Button("Not prime"){
                    if (primes.contains(number) && showX == false && showCheck == false){
                        timeOut()
                    }
                    else if(showX == false && showCheck == false){
                        correct()
                        
                    }
                    
                }.buttonStyle(.borderedProminent)
                    .controlSize(.large)
            }
            
        }
        Spacer()
        Spacer()
        
        VStack(alignment: .leading){
            Text("Score: \(score) - \(wrong)")
        }
    
    }
    
    func newQuestion(){
        showX = false
        showCheck = false
        number = Int.random(in: 1..<100)
    }
}

#Preview {
    ContentView()
}
