//
//  DestinationViewModel.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/29/24.
//

import SwiftUI
import NetworkingService

class DestinationViewModel: ObservableObject {
    @Published var destinationModel: [DestinationModel]? = []
    @State private var isLoading = false
//    let urlString =  "https://mocki.io/v1/7ae8586c-a06f-4e55-97b4-24bb54e6ed49"
    //napr-odf-ს ლინკით
    let urlString =  "https://mocki.io/v1/37673041-14eb-48a6-8344-d4622c1911bb"
    let networking = NetworkingService.shared
    
    init() {
    }
    
    func loadData() {
        let urlString = urlString
        isLoading = true
        networking.fetchCatData(urlString: urlString) { (decodedData: [DestinationModel]?) in
            DispatchQueue.main.async { [weak self] in
                self?.destinationModel = decodedData
                self?.isLoading = false
            }
        }
    }
}

//#Preview {
//    DestinationViewModel()
//}
