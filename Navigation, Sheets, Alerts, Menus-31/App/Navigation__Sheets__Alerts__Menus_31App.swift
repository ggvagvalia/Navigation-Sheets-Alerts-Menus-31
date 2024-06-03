//
//  Navigation__Sheets__Alerts__Menus_31App.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/29/24.
//

import SwiftUI

@main
struct Navigation__Sheets__Alerts__Menus_31App: App {
    @StateObject var destinationViewModel = DestinationViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(destinationViewModel)
        }
    }
}
