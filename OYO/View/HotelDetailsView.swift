//
//  HotelDetailsView.swift
//  OYO
//
//  Created by Vishwa  R on 21/12/21.
//

import SwiftUI

struct HotelDetailsView: View {
    
    @AppStorage("username") var username : String = "Vishwa"

    let image : String
    let hotelName : String
    let description : String
    let price : Int
    let rating : Int
    let features : [Feature]
    
    var body: some View {
        VStack(spacing : 0) {
            ScrollView {
                VStack(alignment : .leading) {
                    AsyncImage(url: URL(string: image)) {
                        image in
                        image.resizable()
                    } placeholder : {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 2)
                            Image(systemName: "photo.fill")
                                .font(.largeTitle)
                        }
                    }
                    .frame(height : 400)
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .background(Color.white)
                    .cornerRadius(12)
                    Text(username)
                    HStack{
                        VStack(alignment : .leading) {
                            //                                Text(hotelName)
                            //                                    .font(.largeTitle)
                            //                                    .bold
                            HStack(alignment : .center, spacing: 0) {
                                Text("₹\(String(price))")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text(" /day")
                                    .font(.footnote)
                                    .fontWeight(.medium)
                            }
                        }
                        Spacer()
                        HStack(alignment : .center){
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 15))
                                .frame(width: 10)
                            Text(String(rating))
                                .font(.system(size: 15))
                        }
                        
                    }
                    Divider()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing : 14) {
                            ForEach(features, id: \.id) { feature in
                                FeaturesCard(iconName: feature.icon_name, iconDesciption: feature.icon_description)
                            }
                        }
                        .padding(.all, 6)
                    }
                    Divider()
                    Text("Details")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(description)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }.padding()
            }
            VStack(spacing : 5) {
                Divider()
                HStack(alignment : .center) {
                    Button(){
                        // Book Hotel Button
                        username = "Swift"
                    } label: {
                        Text("Book Now")
                            .fontWeight(.medium)
                            .frame(maxWidth : .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                .padding(.horizontal, 8)
            }
            .navigationBarTitle(hotelName)
        }
    }
}


struct HotelDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailsView(image: "https://images.venuebookingz.com/18874-1599801503-wm-itc-grand-chola-guindy-chennai-2.jpg", hotelName: "The Park", description: "At The Rocket Hotel, we understand the essence of personalized service, that helps us take care of you in all ways possible. We believe in finding the right balance between luxury, style, comfort, service and your happiness. Because for us, everything matters. Enjoy smartly designed rooms and suites or host an event in flexible meeting and event spaces, get energized in our fitness center or lounge by the rooftop pool. The hotels offer multiple dining options from traditional to international cuisines and everything else that helps us make sure that you are well taken care off. The Raintree Hotels, is a venture by the leading property developer, Ceebros. With hotels at 2 locations in Chennai - St Mary's Road and Anna Salai, it desires to bring a new experience to the world of hospitality.", price: 122, rating: 5, features: [Feature(id: 1, icon_name: "wifi", icon_description: "Wifi")])
            .preferredColorScheme(.dark)
        
        HotelDetailsView(image: "https://images.venuebookingz.com/18874-1599801503-wm-itc-grand-chola-guindy-chennai-2.jpg", hotelName: "The Park", description: "At The Rocket Hotel, we understand the essence of personalized service, that helps us take care of you in all ways possible. We believe in finding the right balance between luxury, style, comfort, service and your happiness. Because for us, everything matters. Enjoy smartly designed rooms and suites or host an event in flexible meeting and event spaces, get energized in our fitness center or lounge by the rooftop pool. The hotels offer multiple dining options from traditional to international cuisines and everything else that helps us make sure that you are well taken care off. The Raintree Hotels, is a venture by the leading property developer, Ceebros. With hotels at 2 locations in Chennai - St Mary's Road and Anna Salai, it desires to bring a new experience to the world of hospitality.", price: 122, rating: 5, features: [Feature(id: 1, icon_name: "wifi", icon_description: "Wifi")])
        
    }
}
