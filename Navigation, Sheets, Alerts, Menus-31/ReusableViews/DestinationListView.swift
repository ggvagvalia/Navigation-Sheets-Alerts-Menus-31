//
//  DestinationListView.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/29/24.
//

import SwiftUI

struct DestinationListView: View {
    let destination: DestinationModel
    
    var body: some View {
        HStack {
            Text("\(destination.city)")
                .font(.headline)
                .bold()
            Spacer()
            ImageView(imageURL: destination.image)
                .frame(width: 180, height: 130)
        }
    }
}
