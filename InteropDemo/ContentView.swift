//
//  ContentView.swift
//  InteropDemo
//
//  Created by Nathan Stouffer on 10/5/23.
//

import SwiftUI
import CxxTest

struct ContentView: View {
    func tester() {
        onyx.constructShared(8)
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("\(onyx.Vector3(7.0).x)")
            Text("\(lucid.tile.Vector4(5.0)[0])")
            Text("\(onyx.constructVector3(3).y)")
            Text(onyx.initialize(40, 80) ? "True" : "False")
            Text("\(onyx.constructShared(7.0).pointee.x)")
            Button(action: tester, label: {
                Text("run tester")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
