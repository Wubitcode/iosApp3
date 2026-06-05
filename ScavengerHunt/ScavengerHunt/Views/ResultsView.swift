//
//  ResultsView.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import SwiftUI

/// `ResultsView` aggregates performance statistics to output tier-based discount rewards.
struct ResultsView: View {
    
    /// Main data pipeline tracking overall exploration achievements.
    @EnvironmentObject var rewardManager: RewardManager
    
    var body: some View {
        ZStack {
            Color(hex: "0A0F1D")
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Spacer()
                
                // MARK: - Decorative Victory Accents
                Image(systemName: "crown.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(hex: "FFB703"))
                
                Text("CAMPAIGN STATUS")
                    .font(.system(.title2, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // MARK: - Metrics Recapitulation Sheet Card
                VStack(spacing: 16) {
                    HStack {
                        Text("Items Found:")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("\(rewardManager.foundCount) / 10")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.2))
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("EARNED REWARD:")
                            .font(.caption)
                            .foregroundColor(Color(hex: "00F5D4"))
                            .tracking(2)
                        
                        // Renders real-time calculated business strings extracted from manager definitions
                        Text(rewardManager.rewardTierMessage)
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.top, 5)
                }
                .padding()
                .background(Color.white.opacity(0.04))
                .cornerRadius(16)
                .padding(.horizontal, 24)
                
                Spacer()
                
                // MARK: - Sync Form Action Component
                Button(action: {
                    print("Uploading performance data metrics to assignment verification servers.")
                }) {
                    Text("SUBMIT SCORE ONLINE")
                        .font(.system(.headline, design: .monospaced))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "00F5D4"))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("Summary")
    }
}

#Preview {
    ResultsView()
        .environmentObject(RewardManager())
}
