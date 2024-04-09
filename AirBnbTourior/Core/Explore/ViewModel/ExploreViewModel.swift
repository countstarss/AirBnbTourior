//
//  ExploreViewModel.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/7.
//

import Foundation


class ExploreViewModel:ObservableObject{
    @Published var listing = [Listing]()
    
    @Published var searchLocation = ""
    
    private let service:ExploreService
    
    
    //创建这个用来实现完成搜索退出之后，显示原来的所有listing
    private var listingCopy = [Listing]()
    
    init(service:ExploreService){
        self.service = service
        
        // 任务等待获取，触发ExplorView
        Task{
            await fetchListing()
        }
    }
    
    
    //异步函数
    func fetchListing() async {
        do{
            self.listing = try await service.fetchListings()
        }catch{
            print("DEBUG: Fail to fetch listing with error,\(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation() {

        //filteredListings是经过filter过滤之后的listing，理论上只显示符合filter 的listing（对象？就是出书计划的四个数据）
        let filteredListings = listing.filter({
            $0.city.lowercased() == searchLocation ||
            $0.state.lowercased() == searchLocation
        })
        //返回到listingCopy的状态
        print("listing:\(listing)")
//        listingCopy = listing
        print("filteredListings:\(filteredListings)")
        print("listingCopy:\(listingCopy)")
        self.listing = filteredListings.isEmpty ? listingCopy : filteredListings
    }
}
