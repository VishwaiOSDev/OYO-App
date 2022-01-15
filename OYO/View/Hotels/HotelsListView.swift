//
//  HotelsListView.swift
//  OYO
//
//  Created by Vishwa  R on 20/12/21.
//

import SwiftUI

struct HotelsListView: View {
    
    @StateObject var viewModel : HotelsViewModel = HotelsViewModel()
    @EnvironmentObject var authenticationViewModel : AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            if !viewModel.loading {
                List(viewModel.hotels) { hotel in
                    VStack {
                        AsyncImage(url: URL(string: hotel.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 2)
                                Image(systemName: "photo.fill")
                                    .font(.largeTitle)
                            }
                            .foregroundColor(.gray)
                            .background(Color.white)
                        }
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 4)
                        HStack{
                            VStack(alignment : .leading) {
                                Text(hotel.hotel_name)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text("₹\(hotel.cost_per_day)/ day")
                                    .font(.callout)
                            }
                            Spacer()
                            HStack(alignment : .center){
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 15))
                                    .frame(width: 10)
                                Text("\(hotel.rating)")
                                    .font(.system(size: 15))
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    .background {
                        NavigationLink(destination: HotelDetailsView(image: hotel.image, hotelName: hotel.hotel_name, description: hotel.description, price: hotel.cost_per_day, rating: hotel.rating, features: hotel.features)) {
                            EmptyView()
                        }
                    }
                }
                .navigationBarTitle("Hotels")
            } else {
                ProgressView("Please wait...")
            }
        }
    }
}



struct HotelsListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelsListView()
            .preferredColorScheme(.dark)
    }
}
