//
//  ContentView.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import SwiftUI

/// `ContentView` serves as the primary root viewport gatekeeper for the application.
/// It orchestrates the initial application launch sequence by embedding the automated splash transition layout.
struct ContentView: View {
    
    var body: some View {
        // App launches direct into your custom timing Splash View pipeline
        SplashView()
    }
}

// MARK: - Preview Structural Diagnostics
#Preview {
    /// Injecting the global RewardManager state modifier into the root preview pipeline
    /// guarantees that all down-stream views instantiated during canvas navigation interactions
    /// can pull the shared state data models without throwing runtime context execution crashes.
    ContentView()
        .environmentObject(RewardManager())
}
