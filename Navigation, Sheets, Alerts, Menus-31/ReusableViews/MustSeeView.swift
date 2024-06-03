//
//  MustSeeView.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/30/24.
//

import SwiftUI

struct MustSeeView: View {
    let destination: DestinationModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.5), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            VStack {
                ButtonsView(destination: destination.mustSee, navigationTitle: "Must See")
                BackToMain(path: $path)
            }
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    MustSeeView()
//}
