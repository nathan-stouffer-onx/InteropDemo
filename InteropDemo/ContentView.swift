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
            Text("\(Vector3(7.0).x)")
            Text("\(lucid.tile.Vector4(5.0)[0])")
            Text("\(constructVector3(3).y)")
            Text(initialize(40, 80) ? "True" : "False")
            //Text("\(constructShared(7.0).pointee.x)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
