//
//  ContentView.swift
//  SwiftUI_App1
//
//  Created by Jaehoon Lee on 2023/01/28.
//

import SwiftUI
import Charts

struct ContentView: View {
    struct Value: Identifiable {
        let id = UUID()
        let x: Int
        let y: Int
    }
    let values = [
        Value(x: 1, y: 10),
        Value(x: 2, y: 30),
        Value(x: 3, y: 20),
        Value(x: 4, y: 30),
        Value(x: 5, y: 40),
        Value(x: 6, y: 50),
        Value(x: 7, y: 40),
    ]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(values) { value in
                    LineMark(
                        x: .value("x", value.x),
                        y: .value("value", value.y))
                }
            }
            Chart(values) { item in
                BarMark(
                    x: .value("x", item.x),
                    y: .value("value", item.y))
            }
            .padding(20)
            Chart {
                BarMark(x: .value("x", 1), y: .value("value", 10))
                BarMark(x: .value("x", 2), y: .value("value", 30))
                BarMark(x: .value("x", 3), y: .value("value", 20))
            }
            .padding(20)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
