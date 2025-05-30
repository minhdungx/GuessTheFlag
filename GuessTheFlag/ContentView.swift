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
            VStack {
                Text("\(threeCountries[trueAns])")
                    .bold()
                ForEach(0...2, id: \.self) { idx in
                    VStack {
                        Image("\(threeCountries[idx])")
                        Text("\(threeCountries[idx])")
                    }
                        .onTapGesture {
                            if idx == trueAns {
                                point += 1
                            }
                            threeCountries = random3countries()
                            trueAns = randomTrueAns()
                        }
                }
                Text("Point: \(point)")
            }

        }
    }
}

#Preview {
    ContentView()
}
