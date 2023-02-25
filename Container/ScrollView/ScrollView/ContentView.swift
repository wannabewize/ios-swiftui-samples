//
//  ContentView.swift
//  ScrollView
//
//  Created by Jaehoon Lee on 2023/02/24.
//

import SwiftUI

struct MyData: Identifiable {
    let id = UUID()
    let value: Int
}

struct ContentView: View {
    let data1 = Array(0..<50)
    let data2 = (0..<50).map { item in
        return MyData(value: item)
    }
    
    var body: some View {
        VStack {
            Text("ScrollView Example")
                .font(.headline)
            
            Text("Vertical")
                .font(.subheadline)
                .padding(.top, 10)
            
            ScrollView() {
                VStack {
                    ForEach(data1, id: \.self) { item in
                        HStack {
                            Text("item")
                            Text("\(item)")
                        }
                        .frame(width: 200, height: 50)
                        .background(Color.teal)
                        .cornerRadius(5)
                    }
                }
            }
            .frame(height: 200)
            
            Divider()
            
            Text("Horizontal")
                .font(.subheadline)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(data2) { item in
                        VStack {
                            Text("\(item.value)")
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.teal)
                        .cornerRadius(10)
                    }
                }
            }
            .frame(height: 100)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
