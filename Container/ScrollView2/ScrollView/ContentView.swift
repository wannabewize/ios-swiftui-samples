//
//  ContentView.swift
//  ScrollView
//
//  Created by Jaehoon Lee on 2023/02/24.
//

import SwiftUI

struct ContentView: View {
    let data = Array(0...50)
    @State var offset: Double = 0
    var body: some View {
        VStack {
            Text("ScrollView Reader Example")
            Text("offset : \(offset)")
            
            ScrollViewReader { proxy in
                HStack {
                    VStack(spacing: 20) {
                        Button("처음") {
                            withAnimation {
                                proxy.scrollTo(0)
                            }
                        }
                        Button("중간") {
                            withAnimation {
                                proxy.scrollTo(25)
                            }
                        }
                        Button("끝") {
                            withAnimation {
                                proxy.scrollTo(50)
                            }
                        }
                    }
                    .padding(.leading, 20)
                    Spacer()
                    ZStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(data, id: \.self) { item in
                                    VStack {
                                        Text("item")
                                        Text("\(item)")
                                    }
                                    .frame(width: 100, height: 100)
                                    .background(Color.teal)
                                    .cornerRadius(10)
                                }
                            }
                        }
//                        GeometryReader { geoProxy in
//                            offset = geoProxy.frame(in: .named("scroll")).minY
//                            Text("")
//                        }
                    }
                    Spacer()

                }
//                .gesture(
//                    DragGesture()
//                        .onChanged({ value in
//                            print("Drag gesture, onChange :", value)
//                        })
//                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
