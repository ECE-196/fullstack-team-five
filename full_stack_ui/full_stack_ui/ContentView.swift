//
//  ContentView.swift
//  full_stack_ui
//
//  Created by Andrew Lara on 10/29/24.
//

import SwiftUI


struct ContentView: View {
    @State var ble = BLE()
    
    var body: some View {
        
        
        ZStack {
            // navigation view
            NavigationView {
                List {
                    Toggle(isOn: $ble.led) {
                        Text("LED")
                    }
                }
                .navigationTitle("FullStack")
                .disabled(!ble.loaded)
            }
            // overlay
            VStack {
                ProgressView()
                    .padding()
                Text(ble.connected ? "Connected. Loading..." : "Looking for device...")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.background)
            .opacity(ble.loaded ? 0 : 1)
        }
        .animation(.default, value: ble.loaded)
    }
}

#Preview {
    ContentView()
}
