//
//  ContentView.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var destinationViewModel = DestinationViewModel()
    @State private var tipsArray = RandomTips.preview()
    @State private var isLoading = false
    @State private var isShowingAlert = false
    @State private var path = NavigationPath()
    @State private var random = 0
    
    var body: some View {
        NavigationStack(path: $path) {
            if isLoading {
                ProgressView("Loading...")
            } else {
                
                // MARK: - ListView
                List {
                    ForEach(destinationViewModel.destinationModel ?? []) { destination in
                        NavigationLink(value: destination) {
                            DestinationListView(destination: destination)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .navigationDestination(for: DestinationModel.self) { destination in
                    DestinationDetailScreen(destination: destination, path: $path)
                }
                
                // MARK: - Toolbar
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Travel Tips") {
                            random = Int.random(in: 0..<tipsArray.count)
                            isShowingAlert = true
                        }
                        .alert("\(tipsArray[random].tip)", isPresented: $isShowingAlert) {
                            Button("OK", role: .cancel) { isShowingAlert = false }
                            
                        } message: {
                            Text("\(tipsArray[random].description )")
                        }
                    }
                }
                .frame(minWidth: 300, idealWidth: 400)
                .navigationTitle("Travel Destinations")
                .listStyle(.plain)
                
            }
        }
        .onAppear {
            destinationViewModel.loadData()
        }
    }
    
}

#Preview {
    ContentView()
}
