//
//  ListView.swift
//  Harmony
//
//  Created by Forrest Kalani Arnold on 3/12/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            List(dataManager.dogs, id: \.id) { dog in
                Text(dog.breed)
            }
            .navigationTitle("Dogs")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: {
                        showPopup.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $showPopup) {
                        NewDogView()
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
        .environmentObject(DataManager())
}
