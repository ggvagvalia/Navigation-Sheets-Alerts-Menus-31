//
//  DestinationModel.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/29/24.
//

import Foundation

struct DestinationModel: Identifiable, Hashable, Decodable {
    var id = UUID()
    var city: String
    var pdf: String?
    var description: String
    var image: String
    var transport: String
    var mustSee: String
    var hotels: String
}

struct RandomTips {
    var tip: String
    var description: String
    
    static func preview() -> [RandomTips] {
        [
            RandomTips(tip: "1. Invest in good equipment", description: "If you are going to multiple places, a good backpack that fits you well and a good, comfortable pair of shoes will be your two most important investments before you leave home. If you’re going to splurge somewhere, splurge on these two essentials"),
            RandomTips(tip: "2. Purchase travel insurance", description: "Look, no one wants to spend money on travel insurance for international travel. But do it anyway. Trust me on this one."),
            RandomTips(tip: "3. Wear your bulky clothing while traveling", description: "This will save room in your backpack on days when everything has to fit."),
            RandomTips(tip: "4. Brush up on safety tips", description: "No, you shouldn’t be afraid of exploring the world. But you should be smart about it while you’re traveling. Research safety tips for backpacking and traveling, and then stay aware of your surroundings and keep them front of mind during your trip."),
        ]
    }
    
}
