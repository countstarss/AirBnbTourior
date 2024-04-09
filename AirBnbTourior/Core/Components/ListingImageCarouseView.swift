//
//  ListingImageCarouseView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/5.
//

import SwiftUI

// 组件里边只放最必要，并且可以重用的内容
// 就比如这个carouse组件，实现功能就好，frame和边框圆角用的时候再写
struct ListingImageCarouseView: View {
//    var images = [
//        "listing-1",
//        "listing-2",
//        "listing-3",
//        "listing-4"
//    ]
    let listing:Listing
    
    var body: some View {
        //image
        TabView{
            ForEach(listing.imageUrls,id:\.self){ image in
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)

            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouseView(listing: DeveloperPreview.shared.listing[0])
}
