//
//  ContentView.swift
//  Buttons
//
//  Created by wannabewize on 2023/08/15.
//

import SwiftUI

struct ContentView: View {
    @State var clicked = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Button1") {
                print("Button1 clicked")
            }
            
            Button(action: {
                clicked.toggle()
            }, label: {
                if clicked {
                    Text("Button") }
                else {
                    Text("Clicked")
                }
            })
            
            Button("Button with \(clicked ? "pencil" : "eraser")", systemImage: clicked ? "pencil" : "eraser") {
                clicked.toggle()
            }
            
            HStack {
                Button(role: ButtonRole.destructive) {
                    print("destructive")
                } label: {
                    Label("label title", systemImage: "trash")
                        .imageScale(.large)
                        .labelStyle(.iconOnly)
                }
                
                Button(role: ButtonRole.cancel) {
                    print("cancel")
                } label: {
                    Label("cancel", systemImage: "return")
                        .labelStyle(.iconOnly)
                }
            }                        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
