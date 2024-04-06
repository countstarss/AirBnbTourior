//
//  ListingView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/5.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    var body: some View {
        VStack(spacing:8){
            //image
            TabView{
                ForEach(images,id:\.self){ image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            .frame(height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .tabViewStyle(.page)
                
            //listing details
            
            HStack(alignment:.top){
                //details
                VStack(alignment: .leading){
                    Text("Miami Florida")
                        .fontWeight(.semibold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3-10")
                        .foregroundStyle(.gray)
                    
                    HStack{
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                
                Spacer()
                
                //rating
                HStack(spacing:3){
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
            }
            .font(.footnote)
//            .background(.blue)
        }.padding()
        
    }
}

#Preview {
    ListingItemView()
}
