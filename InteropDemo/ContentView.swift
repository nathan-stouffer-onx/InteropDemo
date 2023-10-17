//
//  ContentView.swift
//  InteropDemo
//
//  Created by Nathan Stouffer on 10/5/23.
//

import SwiftUI
import onyx

struct ContentView: View {
    func tester() {
        onyx.initialize(90, 90)
        onyx.shutdown()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
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
