//
//  ContentView.swift
//  InteropDemo
//
//  Created by Nathan Stouffer on 10/5/23.
//

import SwiftUI
import Metal

import onyx

struct ContentView: View {
    
    static func window() -> CAMetalLayer {
        let layer = CAMetalLayer()
        layer.pixelFormat = .bgra8Unorm
        layer.framebufferOnly = true
        layer.backgroundColor = UIColor.red.cgColor
        return layer
    }
    
    var device: MTLDevice! = MTLCreateSystemDefaultDevice()
    var metalLayer: CAMetalLayer! = window()
    
    func initialize() {
        metalLayer.device = device
        let unsafeMetalLayer = UnsafeMutableRawPointer(Unmanaged.passRetained(metalLayer).toOpaque())
        let unsafeMetalDevice = UnsafeMutableRawPointer(Unmanaged.passRetained(device).toOpaque())

        onyx.initialize(90, 90, unsafeMetalLayer, unsafeMetalDevice)
    }
    func shutdown() {
        onyx.shutdown()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button(action: initialize, label: {
                Text("initiliaze")
            })
            Button(action: shutdown, label: {
               Text("shutdown")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
