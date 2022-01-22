//
//  OwnerRootView.swift
//  OYO
//
//  Created by Vishwa  R on 18/01/22.
//

import SwiftUI

struct OwnerRootView: View {
    var body: some View {
        TabView {
            OwnerView()
                .tabItem {
                    Label("Fill", systemImage: "square.text.square")
                }
            
            BookedListView()
                .tabItem {
                    Label("Booked", systemImage: "list.triangle")
                }
        }
    }
}

struct OwnerRootView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerRootView()
    }
}
