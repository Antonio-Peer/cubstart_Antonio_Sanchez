//
//  ContentView.swift
//  waitlisthelper-skeleton
//
//  Created by Jordan Yee on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    
    var body: some View {
        //YOUR CODE HERE (NavView)//
        NavigationView {
            //YOUR CODE HERE (TabView)//
            TabView{
                ZStack {
                    //YOUR CODE HERE (background)//
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                
                    VStack {
                        Spacer()
                        //YOUR CODE HERE (title)//
                        Text("Will You Get off the Waitlist?")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .padding()
                        Spacer()
                        
                        HStack {
                            //YOUR CODE HERE (description)//
                            Text("Place on Waitlist: \(waitlistPlace, specifier: "%.f")")
                            
                            Spacer()
                        }
                        //YOUR CODE HERE (slider)//
                        Slider(value: $waitlistPlace, in: 0...200, step: 1)
                            .accentColor(.red)
                       
                        HStack {
                            //YOUR CODE HERE (description)//
                            Text("Class Size: \(classSize, specifier: "%.f")")
                            
                            Spacer()
                        }
                        //YOUR CODE HERE (slider)//
                        Slider(value: $classSize, in: 0...1000, step: 1)
                            .accentColor(.red)
                        
                        NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                        
                        Button("CALCULATE") {
                            //YOUR CODE HERE (calculate)//
                            calculateProbability(waitlistPlace: Int(waitlistPlace), classSize: Int(classSize))
                            text = getFeedbackText()
                            calculate = true
                        } .buttonStyle(CustomButton())
                            .padding(12)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                        Spacer()
                        
                    } .padding()
                        .navigationBarTitle("Home")
                        .navigationBarHidden(false)
                }
            .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
                }
                ZStack {
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            Text("Classes Left to Graduate")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(Color.black)
                                .padding(.top)
                            Spacer()
                        } .padding()
                        Spacer()
                        }
                }
                .navigationBarHidden(true)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Needed")
                    }
            }
        }
    }
    func calculateProbability(waitlistPlace: Int, classSize: Int) {
        //YOUR CODE HERE//
        let tenth = classSize / 10
        if (waitlistPlace <= tenth) {
            probability = 100
        } else if (waitlistPlace > tenth * 2) {
            probability = 0
        } else {
            probability = 100 - Int(((Float(waitlistPlace - tenth) / Float(tenth)) * 100))
        }
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    var body: some View {
        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    //YOUR CODE HERE (button back)//
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                    }
                    .navigationBarHidden(true)
                    
                    Spacer()
                } .padding()
                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding()
        }
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //YOUR CODE HERE (button style)//
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
