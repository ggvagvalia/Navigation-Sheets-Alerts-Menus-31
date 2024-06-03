//
//  ImageView.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/29/24.
//

import SwiftUI

struct ImageView: View {
    let imageURL: String
    
    var body: some View {
        if let imageURL = URL(string: imageURL) {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
        } else {
            Text("no image in URL")
        }
    }
}

//#Preview {
//    ImageView()
//}
