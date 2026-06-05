//
//  ClueListView.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import SwiftUI

/// `ClueListView` renders the primary master-navigation interface of the app.
/// It displays the player's active target discovery counts alongside a scrollable roster
/// of all participating commercial venues.
struct ClueListView: View {
    
    /// Global state container injected via environment pipeline to track modifications across screens.
    @EnvironmentObject var rewardManager: RewardManager
    
    /// Local state flag controlling the presentation binding of the final reward compilation dashboard.
    @State private var showResults = false
    
    var body: some View {
        ZStack {
            // Establishes the modern high-contrast background foundation layer
            Color(hex: "0A0F1D")
                .ignoresSafeArea()
            
            VStack {
                // MARK: - Progress Status Header
                HStack {
                    Text("PROGRESS:")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)
                    
                    // Live-evaluating text string bound directly to the publisher layer
                    Text("\(rewardManager.foundCount) / 10 FOUND")
                        .font(.caption)
                        .bold()
                        .foregroundColor(Color(hex: "00F5D4"))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // MARK: - Master Target Roster Loop
                List(0..<rewardManager.items.count, id: \.self) { index in
                    NavigationLink(destination: DetailView(itemIndex: index)) {
                        HStack(spacing: 15) {
                            
                            // Contextual emblem configuration displaying dynamic state transformations
                            Image(systemName: rewardManager.items[index].isFound ? "checkmark.circle.fill" : "scope")
                                .foregroundColor(rewardManager.items[index].isFound ? Color.green : Color(hex: "00F5D4"))
                                .font(.title3)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(rewardManager.items[index].businessName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(rewardManager.items[index].clue)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .lineLimit(1) // Truncates preview strings cleanly inside the list row
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.03))
                }
                .scrollContentBackground(.hidden) // Strips standard native iOS gray background tables
                
                // MARK: - Navigation Footer Action Section
                Button(action: {
                    showResults = true
                }) {
                    Text("VIEW HUNT RESULTS")
                        .font(.system(.subheadline, design: .monospaced))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Hidden Targets")
        .navigationBarTitleDisplayMode(.inline)
        // MARK: - Modern Presentation Layer Redirection
        .navigationDestination(isPresented: $showResults) {
            ResultsView()
        }
    }
}

// MARK: - Preview Provider Archetype
#Preview {
    ClueListView()
        .environmentObject(RewardManager())
}
