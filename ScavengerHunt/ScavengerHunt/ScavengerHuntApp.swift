//
//  ScavengerHuntApp.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import SwiftUI

@main
struct ScavengerHuntApp: App {
    
    /// Establishes the concrete, long-lived data source of truth for the entire application lifecycle.
    /// Utilizing `@StateObject` ensures that our state manager is initialized only once when the app boots up,
    /// preventing data destruction during view updates or screen switches.
    @StateObject private var rewardManager = RewardManager()

    var body: some Scene {
        WindowGroup {
            // Root view of the app
            ContentView()
                // Injecting the global business logic context down through the environment pipeline.
                // This makes 'rewardManager' accessible to every subview without explicit manual passing.
                .environmentObject(rewardManager)
        }
    }
}
