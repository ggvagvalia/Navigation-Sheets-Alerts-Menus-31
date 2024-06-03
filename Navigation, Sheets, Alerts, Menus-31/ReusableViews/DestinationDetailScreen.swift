//
//  DestinationDetailScreen.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/29/24.
//

import SwiftUI

struct DestinationDetailScreen: View {
    let destination: DestinationModel
    @EnvironmentObject var chosenDestinatioin: DestinationViewModel
    
    @Binding var path: NavigationPath
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.5), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            
            VStack {
                Spacer()
                ImageView(imageURL: destination.image)
                    .frame(width: 380)
                ScrollView {
                    Text("\(destination.description)")
                        .padding()
                        .font(.system(size: 20))
                }
                .frame(width: 400, height: 370)
                Spacer()
                Button(action: {
                    if let pdfURLString = destination.pdf {
                           if let url = URL(string: pdfURLString) {
                               UIApplication.shared.open(url)
                           }
                       }
                }) {
                    Text("pdfff")
                }
                .buttonBorderShape(.capsule)
                HStack {
                    NavigationLink(destination: TransportView(destination: destination, path: $path)) {
                        Text("Transport")
                            .bold()
                            .frame(width: 110, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                    NavigationLink(destination: MustSeeView(destination: destination, path: $path) ) {
                        Text("MustSee")
                            .bold()
                            .frame(width: 110, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                    NavigationLink(destination: HotelsView(destination: destination, path: $path) ) {
                        Text("Hotels")
                            .bold()
                            .frame(width: 110, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .frame(height: 50)
                .padding(20)
                .padding(.bottom, 30)
            }
            .padding(.top, 55)
            .safeAreaPadding(.top)
            .navigationTitle("\(destination.city)")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .ignoresSafeArea()
    }
}
//
//#Preview {
//    NavigationStack {
//        DestinationDetailScreen(destination: DestinationModel(id: UUID(), city: "opana", description: "djfchh alsjn.kj aksjb.ad daljhb ad asj,hbd wsdhjbaj asdjhb", image: "https://img.delicious.com.au/ttEaxwsa/del/2018/12/new-york-usa-97371-2.jpg"))
//            .environmentObject(DestinationViewModel())
//        }
//}
