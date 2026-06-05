//
//  HomeView.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import SwiftUI

/// `HomeView` handles onboarding data display setups, introducing the hunt rules.
struct HomeView: View {
    
    /// References the global state container across operational view stacks.
    @EnvironmentObject var rewardManager: RewardManager
    
    /// Structural active routing property verifying link stack configurations.
    @State private var navigateToHunt = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "0A0F1D")
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    // MARK: - App Instruction Card Panel View
                    VStack(spacing: 15) {
                        Text("WELCOME EXPLORER")
                            .font(.system(.title2, design: .monospaced))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "00F5D4"))
                        
                        Text("Help support local commerce! Locate hidden objects across 10 businesses, snap verification photos, and unlock massive shopping discounts.")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.1), lineWidth: 1))
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // MARK: - Navigation Action Portal
                    Button(action: { navigateToHunt = true }) {
                        HStack {
                            Text("START HUNT")
                                .font(.system(.headline, design: .monospaced))
                                .fontWeight(.bold)
                            Image(systemName: "play.fill")
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "00F5D4"))
                        .cornerRadius(12)
                        .shadow(color: Color(hex: "00F5D4").opacity(0.4), radius: 10)
                    }
                    .padding(.horizontal, 30)
                }
            }
            .navigationBarHidden(true)
            // MARK: - Modern Type-Safe Navigation Target
            .navigationDestination(isPresented: $navigateToHunt) {
                ClueListView()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(RewardManager())
}
