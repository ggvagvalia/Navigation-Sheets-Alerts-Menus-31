//
//  TransportView.swift
//  Navigation, Sheets, Alerts, Menus-31
//
//  Created by gvantsa gvagvalia on 5/30/24.
//

import SwiftUI

struct ContractResponse: Codable {
    let text: String
}

class ContractViewModel: ObservableObject {
    @Published var contractText = ""
    @Published var name1: String = ""
    @Published var name2: String = ""
    
    func fetchContract() {
// ხელშ-ის დრაფტის მოქ-api
        guard let url = URL(string: "https://mocki.io/v1/9713e517-865c-429e-84f0-8e5b701a7a2d") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ContractResponse].self, from: data) {
                DispatchQueue.main.async {
                    self.contractText = decodedResponse[0].text
                }
            }
        }.resume()
    }
    
}

struct TransportView: View {
    let destination: DestinationModel
    @Binding var path: NavigationPath
    @StateObject var viewModel = ContractViewModel()
    
    @State private var name1: String = ""
    @State private var name2: String = ""
    
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.5), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            VStack {
                Text(name1)
                TextField("Party 1 Name", text: $name1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Party 2 Name", text: $name2)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Update Contract", action: updateContractText)
                    .padding()
                Button("Download Contract", action: downloadContract)
                    .padding()
                
                TextEditor(text: $viewModel.contractText)
                    .padding()
                    .border(Color.gray)
                    .onAppear {
                        viewModel.fetchContract()
                    }
                
                
                ButtonsView(destination: destination.transport, navigationTitle: "Transport")
                BackToMain(path: $path)
            }
        }
        //        .ignoresSafeArea()
    }
    private func updateContractText() {
        var newText = viewModel.contractText
        newText = newText.replacingOccurrences(of: "გამყიდველი (სახელი, გვარი, პ/ნ)", with: "გამყიდველი \(name1)")
        newText = newText.replacingOccurrences(of: "დამყიდველი (სახელი, გვარი, პ/ნ)", with: "დამყიდველი \(name2)")
        viewModel.contractText = newText
    }
    
//    არ ააფდეითებს რო წერ ეგრევე - ღლაკძე დაჭერა ჭრდება.
//    პდფ - გადმოწერას აჩვენებს მაგრამ ფაილი ცარიელია მერე რო ვხსნი.
       private func downloadContract() {
           
           let contractText = viewModel.contractText
           
           if let data = contractText.data(using: .utf8) {
               let filename = "contract.pdf"
               let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
               do {
                   try data.write(to: url)

                    let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
               } catch {
                   print("Error saving PDF:", error.localizedDescription)
               }
           }
       }
}

//#Preview {
//    TranspotView()
//}
