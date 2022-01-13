////
////  ProfileView.swift
////  OYO
////
////  Created by Vishwa  R on 11/01/22.
////
//
//import SwiftUI
//
//struct ProfileView: View {
//
//    @EnvironmentObject var setting : AuthenticationViewModel
//    
//    var body: some View {
//
//        VStack(alignment: .leading) {
//
//            header
//
//            mainCard
//
//            phoneCard
//
//            Spacer()
//
//            SignOutButton(action: signOutPressed, label: "Sign Out")
//
//        }
//        .padding()
//        .onAppear {
////            setting.decodeUser(of: Storage.loggedEmail)
//        }
//    }
//
//
//    var header : some View {
//        Text("Profile")
//            .font(.largeTitle)
//            .bold()
//    }
//
//    var mainCard : some View {
//        ZStack {
//            cardDetails
//        }
//    }
//
//    var cardDetails : some View {
//        VStack {
//
//            circleAvatar
//
//            nameIcon
//
//            Text(setting.userDetails.email)
//                .tint(.gray)
//
//        }
//        .frame(maxWidth : .infinity)
//        .padding()
//        .background(Color("FieldBackground"))
//        .cornerRadius(12)
//    }
//
//    var circleAvatar : some View {
//        Text(setting.userDetails.name.prefix(1))
//            .font(.largeTitle)
//            .padding(25)
//            .background(.gray)
//            .clipShape(Circle())
//    }
//
//    var nameIcon : some View {
//        HStack {
//            Text(setting.userDetails.name)
//                .font(.largeTitle)
//            Image(systemName: "checkmark.seal.fill")
//                .foregroundColor(.green)
//                .font(.title3)
//        }
//    }
//
//    var phoneCard : some View {
//        HStack(spacing : 4) {
//            VStack(alignment : .center) {
//                Text("Phone")
//                    .font(.caption)
//
//                Text(setting.userDetails.phone)
//            }
//        }
//        .frame(maxWidth : .infinity)
//        .padding()
//        .background(Color("FieldBackground"))
//        .cornerRadius(12)
//    }
//
//    //MARK: - Sign Out Logic is done here
//
//    func signOutPressed() {
//        Storage.loggedEmail = ""
//        DispatchQueue.main.async {
//            setting.isLoggedIn = false
//        }
//    }
//}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//            .preferredColorScheme(.dark)
//    }
//}
