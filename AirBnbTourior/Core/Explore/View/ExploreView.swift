//
//  ExploreView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/5.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @State var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack{
            
            if showDestinationSearchView{
                //在DestinationSearchView中设置好绑定的内容之后
                //将showDestinationSearchView传入DestinationSearchView
                //让两个view共享bool，也可通过这个返回上一层
                DestinationSearchView(show: $showDestinationSearchView,viewModel: viewModel)
                    .environmentObject(viewModel)
            }
            else{
                ScrollView{
                    //搜索框放在Listing Stack的上面
                    //传入viewModel.searchLocation的时候，前面需要加$
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                    // 点击搜索框区域的效果，进入搜索页，通过一个flag：showDestinationSearchView 来控制
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing:30){
                        ForEach(viewModel.listing) { listing in
                            NavigationLink(value:listing){
                                ListingItemView(listing: listing)
                                    .frame(height: 330)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            
                        }
                    }
                    
                }.navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        
        }
        
    }
}

#Preview {
    ExploreView()
}
