//
//  ButtonsView.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/30/24.
//

import SwiftUI

struct ButtonsView: View {
    let destination: String
    let navigationTitle: String
    
    var body: some View {
        Text("\(destination)")
            .padding()
            .navigationTitle("\(navigationTitle)")
    }
}

//#Preview {
//    ButtonsView()
//}
