//
//  RewardManager.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

//
//  RewardManager.swift
//  ScavengerHunt
//
//  Created by Admin on 2026-06-04.
//

import Foundation
import Combine
import SwiftUI

/// `RewardManager` coordinates state changes, calculations, and tier evaluation rules.
/// This acts as the centralized source of truth across all 5 view hierarchies by conforming
/// to `ObservableObject` and emitting state updates automatically through property publishers.
class RewardManager: ObservableObject {
    
    /// Published collection tracking the real-time interaction states of all 10 target hunt objectives.
    @Published var items: [HuntItem] = []
    
    /// Initializer instantiating the central model layer with default values.
    init() {
        self.items = HuntData.defaultItems
    }
    
    /// Dynamic computed property evaluating the absolute quantity of successfully resolved items.
    var foundCount: Int {
        items.filter { $0.isFound }.count
    }
    
    /// Dynamic conditional pipeline verifying status thresholds to return corresponding commercial coupon strings.
    /// Implements tiered logic: 5+ found rewards 10%, 7+ found rewards 20%, 10 found adds grand prize status.
    var rewardTierMessage: String {
        switch foundCount {
        case 10:
            return "20% OFF CODE + $5,000 GRAND PRIZE DRAW ENTRY!"
        case 7...9:
            return "20% OFF DISCOUNT CODE UNLOCKED!"
        case 5...6:
            return "10% OFF DISCOUNT CODE UNLOCKED!"
        default:
            return "FIND \(5 - foundCount) MORE ITEMS TO UNLOCK DISCOUNTS!"
        }
    }
}
