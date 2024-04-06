//
//  ExploreView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/5.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                //搜索框放在Listing Stack的上面
                SearchAndFilterBar()
                
                LazyVStack(spacing:30){
                    ForEach(0 ... 10,id: \.self) { listing in
                        NavigationLink(value: listing){
                        ListingItemView()
                            .frame(height: 330)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }
                    }.padding()
                    
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
                
            }
        }
    }
}

#Preview {
    ExploreView()
}

