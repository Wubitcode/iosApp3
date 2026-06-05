//
//  HuntData.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import Foundation

/// `HuntData` serves as the centralized data repository for the Scavenger Hunt campaign.
/// This decoupled architecture isolates the raw content strings from the SwiftUI view layers,
/// allowing for easier maintenance and pairing with asset catalog names.
struct HuntData {
    
    /// A static collection of the 10 core business checkpoints required by the Chamber of Commerce.
    /// Explicitly aligned with the Asset Catalog keys to prevent image loading runtime errors.
    static let defaultItems: [HuntItem] = [
        HuntItem(businessName: "Coffee Shop", clue: "Where espresso meets vintage vinyl. Look near the record player!"),
        HuntItem(businessName: "Book Store", clue: "In the mystery aisle, beneath the clock that ticks backwards."),
        HuntItem(businessName: "Movie Theatre", clue: "Behind the velvet curtains near the smell of fresh popcorn."),
        HuntItem(businessName: "Restaurant", clue: "Under the candlelit corner booth table near the kitchen doors."),
        HuntItem(businessName: "Bakery", clue: "Hiding right under the main tiered glass cupcake display case."),
        HuntItem(businessName: "Ice Cream Shop", clue: "Next to the neon waffle cone sign where the sprinkles are kept!"),
        HuntItem(businessName: "Library", clue: "Deep in the local history archives, tucked behind an old map."),
        HuntItem(businessName: "Park", clue: "Beneath the shadow of the historic sundial near the rose garden."),
        HuntItem(businessName: "Arcade", clue: "High score champion! Look right next to the classic Pac-Man machine."),
        HuntItem(businessName: "Sports Store", clue: "Guarded closely by the basketball jersey display near the rear wall.")
    ]
}
