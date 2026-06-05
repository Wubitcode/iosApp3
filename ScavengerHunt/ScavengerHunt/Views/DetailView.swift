//
//  DetailView.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import SwiftUI

/// `DetailView` exposes the comprehensive expanded exploration view context for a single business location.
/// Isolates clues and integrates an interactive asset capture verification simulation interface.
struct DetailView: View {
    
    /// Global object configuration listening to core state data updates across active views.
    @EnvironmentObject var rewardManager: RewardManager
    
    /// Passed structural identification tracking the selected object's precise index offset inside the master array.
    let itemIndex: Int
    
    var body: some View {
        ZStack {
            Color(hex: "0A0F1D")
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                // MARK: - Header Entity Name
                Text(rewardManager.items[itemIndex].businessName)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // MARK: - Dynamic Asset Image Presentation Card
                // Loads the custom image asset using the business name string directly from the data layer
                Image(rewardManager.items[itemIndex].businessName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(rewardManager.items[itemIndex].isFound ? Color.green : Color(hex: "00F5D4").opacity(0.6), lineWidth: 2)
                    )
                    .shadow(color: Color(hex: "00F5D4").opacity(0.15), radius: 10)
                    .padding(.horizontal)
                
                // MARK: - Clue Card Render Block
                VStack(spacing: 12) {
                    Text("🕵️‍♂️ HIDDEN CLUE BLUEPRINT")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "00F5D4"))
                        .tracking(1.5)
                    
                    Text(rewardManager.items[itemIndex].clue)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .lineSpacing(6)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.03))
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.08), lineWidth: 1))
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - Device Capture Interaction Workspace
                if rewardManager.items[itemIndex].isFound {
                    // Success View State Presentation
                    VStack(spacing: 12) {
                        Image(systemName: "checkmark.seal.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green)
                        
                        Text("TARGET OBJECT RECORDED")
                            .font(.system(.subheadline, design: .monospaced))
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                    }
                    .padding(.bottom, 20)
                } else {
                    // Interaction Capture Button Component Node
                    VStack(spacing: 15) {
                        Button(action: {
                            // Mutates the referenced item model property with subtle spring animations
                            withAnimation(.spring()) {
                                rewardManager.items[itemIndex].isFound = true
                            }
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "camera.fill")
                                Text("SNAP TARGET PHOTO")
                                    .font(.system(.subheadline, design: .monospaced))
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "00F5D4"))
                            .cornerRadius(12)
                            .shadow(color: Color(hex: "00F5D4").opacity(0.3), radius: 8)
                        }
                        .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 20)
                }
            }
            .padding(.top, 10)
        }
    }
}

// MARK: - Preview Structural Isolation Diagnostics
#Preview {
    DetailView(itemIndex: 0)
        .environmentObject(RewardManager())
}
