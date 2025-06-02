//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by DungHM on 30/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var trueAns = 0
    @State var threeCountries = ["Estonia",
                                 "France",
                                 "Germany"]
    @State var point = 0
    let countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Monaco",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ]
    
    func random3countries() -> [String] {
        return Array(countries.shuffled().prefix(3))
    }
    
    func randomTrueAns() -> Int {
        return Int.random(in: 0...2)
    }
    
    var body: some View {
        
        
        GeometryReader { geo in
            ZStack() {
                
                RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                                       .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                    .ignoresSafeArea()
                
                
                
                VStack {
                    Spacer()
                    Text("Guess the flag")
                        .font(.largeTitle.weight(.semibold))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    VStack(alignment: .center, spacing: 15) {
                        
                        VStack {
                            Text("Tap the flag of")
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                                .padding(.top, 10)
                            Text("\(threeCountries[trueAns])")
                                .bold()
                                .font(.system(size: 30))
                            
                        }
                        ForEach(0...2, id: \.self) { idx in
                            Image("\(threeCountries[idx])")
                                .renderingMode(.original)
                                .clipShape(.capsule)
                                .shadow(radius: 5
                                )
                                .onTapGesture {
                                    if idx == trueAns {
                                        point += 1
                                    }
                                    threeCountries = random3countries()
                                    trueAns = randomTrueAns()
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                    Spacer()
                    
                    Text("Score: \(point)")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
