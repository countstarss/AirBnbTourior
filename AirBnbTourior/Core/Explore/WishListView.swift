//
//  WishListView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/7.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading,spacing:24){
    //            Text("WishLists")
    //                .font(.title)
    //                .fontWeight(.bold)
                VStack(alignment:.leading,spacing: 8){
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    Text("You can create,view or edit widhlist once you've loged in")
                        .foregroundStyle(Color(.systemGray))
                }
                .padding()

                LoginButtonView(title: "Log in")
                    
                Spacer()
            //NavigationTitle必须添加在NavigationStack中的Stack中
            }.navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishListView()
}
