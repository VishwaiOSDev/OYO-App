//
//  HotelsListView.swift
//  OYO
//

//  Created by Vishwa  R on 20/12/21.
//
import SwiftUI

struct HotelsListView: View {
    
    @EnvironmentObject var viewModel : HotelViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.hotels) { hotel in
                NavigationLink(destination: HotelDetailsView(hotel : hotel)) {
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
            }
            .onAppear {
                viewModel.getListOfHotels()
            }
            .navigationViewStyle(.stack)
            .navigationTitle("Hotels")
        }
    }

}

struct HotelsListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelsListView()
            .preferredColorScheme(.dark)
    }
}

