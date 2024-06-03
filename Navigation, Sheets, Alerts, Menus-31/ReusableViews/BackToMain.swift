//
//  BackToMain.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/30/24.
//

import SwiftUI

struct BackToMain: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Button(action: {
            path = NavigationPath()
        }) {
            Text("Back To Main")
                .bold()
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding()
        }
        .padding()
    }
}

//
//#Preview {
//    BackToMain()
//}
