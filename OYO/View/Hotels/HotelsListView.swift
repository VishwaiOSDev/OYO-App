//
//  HotelsListView.swift
//  OYO
//

//  Created by Vishwa  R on 20/12/21.
//
import SwiftUI

struct HotelsListView: View {
    
    @EnvironmentObject var viewModel : UserViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.hotels) { hotel in
                VStack(alignment : .leading) {
                    Text(hotel.hotelName)
                        .font(.title)
                        .bold()
                    Text("₹\(hotel.hotelPrice)/ day")
                        .font(.title2)
                    Text(hotel.hotelDescription)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }
            .onAppear {
                viewModel.getListOfHotels()
            }.navigationTitle("Hotels")
        }
    }

}

struct HotelsListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelsListView()
            .preferredColorScheme(.dark)
    }
}

