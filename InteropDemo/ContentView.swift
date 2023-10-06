//
//  ContentView.swift
//  InteropDemo
//
//  Created by Nathan Stouffer on 10/5/23.
//

import SwiftUI
import CxxTest

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("\(lucid.tile.Vector3(5.0).x)")
            Text("\(Vector3(7.0).x)")
            //Text("\(constructShared(7.0).pointee.x)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
