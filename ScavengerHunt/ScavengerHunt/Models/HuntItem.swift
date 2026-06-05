//
//  HuntItem.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import Foundation

/// `HuntItem` represents the core data model for an individual exploration milestone.
/// Conforms to `Identifiable` to ensure seamless rendering in standard iterative SwiftUI list views
/// without requiring custom hash identifiers. Conforms to `Equatable` to support structural comparison.
struct HuntItem: Identifiable, Equatable {
    
    /// Unique structural identifier generated on model initialization.
    let id = UUID()
    
    /// The explicit commercial name of the business target (e.g., "Coffee Shop").
    let businessName: String
    
    /// The cryptographic hint or riddle provided to guide the participant's tracking.
    let clue: String
    
    /// Global state tracker tracking whether a user has successfully photographed the item.
    var isFound: Bool = false
}
