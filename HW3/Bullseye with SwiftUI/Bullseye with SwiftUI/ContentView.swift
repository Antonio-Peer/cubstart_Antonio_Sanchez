//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI


struct ContentView: View {
    @State var number = 25
    @State var sliderValue: Double = 50
    @State var maxSliderValue: Double = 100
    @State var toggle = false
    
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score:")
                    Text("0")
                }
                .padding(.leading, 20)
                
                Spacer()
                
                VStack() {
                    Text("Current Level:")
                    Text("1")
                }
                .padding(.trailing, 20)
            }
            
            Spacer()
            
            VStack(){
                Text("Move the slider to:")
                    .font(.system(size: 30))
                Text(String(number))
                    .font(.system(size: 30))
                Slider(value: $sliderValue, in: 0...maxSliderValue)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                //Button("Check")
            }
            
            Spacer()
            
            VStack(){
                Text("Exact Mode")
                Toggle("Toggle", isOn: $toggle).labelsHidden()
            }
        }
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}

