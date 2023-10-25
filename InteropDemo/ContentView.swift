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
    
    func files() {
        let fm = FileManager.default
        do
        {
            let items = try fm.subpathsOfDirectory(atPath: NSHomeDirectory())
            for item in items {
                print("Found \(item)")
            }
        } catch {
            print("here")
        }
    }
    
    func initialize() {
        metalLayer.device = device
        let unsafeMetalLayer = UnsafeMutableRawPointer(Unmanaged.passRetained(metalLayer).toOpaque())
        let unsafeMetalDevice = UnsafeMutableRawPointer(Unmanaged.passRetained(device).toOpaque())

        guard let bundle = Bundle(path: Bundle.main.bundlePath + "/TestOnyxPackage_Assets.bundle")?.bundlePath else {
            print("Failed to find assets path")
            return
        }
                
        onyx.initialize(90, 90, unsafeMetalLayer, unsafeMetalDevice, std.string(bundle + "/"))
    }
    func shutdown() {
        onyx.shutdown()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button(action: files, label: {
                Text("files")
            })
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
