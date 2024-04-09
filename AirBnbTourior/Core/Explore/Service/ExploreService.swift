//
//  ExploreService.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/7.
//

import Foundation


class ExploreService{
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listing
    }
}
