//
//  ListingView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/5.
//

import SwiftUI

struct ListingItemView: View {
    
//    let item:Int

    
    let images = [
        "listing-1",
        "listing-4",
        "listing-3",
        "listing-2",
    ]
    
    let listing:Listing
    
    // 下面的全部内容全部从传入的Listing中取出 ！！！
    var body: some View {
        VStack(spacing:8){
            //image
            ListingImageCarouseView(listing: listing)
            .frame(height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .tabViewStyle(.page)
                
            //listing details
            HStack(alignment:.top){
                //details
                VStack(alignment: .leading){
                    Text("\(listing.city),\(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3-10")
                        .foregroundStyle(.gray)
                    
                    HStack{
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                //rating
                HStack(spacing:3){
                    Image(systemName: "star.fill")
                    
                    Text("\(String(listing.rating))")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
//            .background(.blue)
        }.padding()
        
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listing[0])
}
