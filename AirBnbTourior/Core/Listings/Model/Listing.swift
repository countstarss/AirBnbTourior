//
//  Listing.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/7.
//

import Foundation

struct Listing:Identifiable,Codable,Hashable{
    let id:String
    let title:String
    let ownerId:String
    let ownerName:String
    let ownerImageUrl:String
    let numOfGuests:Int
    let numOfBedrooms:Int
    let numOfBethrooms:Int
    let numOfBeds:Int
    let pricePerNight:Int
    let latitude:Double
    let longitude:Double
    let imageUrls:[String]
    let address:String
    let city:String
    let state:String
    var rating:Double
    
    var features:[ListingFeature]
    var things:[ListingThings]
    var type:[ListingType]
}
// 通过枚举类型添加拥有的功能
enum ListingFeature:Int,Codable,Identifiable,Hashable{
    case selfCheckin
    case superHost
    
    var imageName:String{
        switch self{
        case .selfCheckin   :return "door.left.hand.open"
        case .superHost     :return "medal"
        }
    }
    
    var title:String{
        switch self{
        case .selfCheckin   :return "self Checkin"
        case .superHost     :return "Super Host"
        }
    }
    
    var subTile:String{
        switch self{
        case .selfCheckin   :return "Check youself in with the keypad"
        case .superHost     :return "Superhero are experienced,highly rates who are commited to providing frate stars for guests"
        }
    }
    
    // 给Feature添加id，使用返回的id选择添加哪些Feature
    var id:Int{
        return self.rawValue
    }
}


enum ListingThings:Int,Codable,Identifiable,Hashable{
    case pool           = 0
    case kitchen        = 1
    case wifi           = 2
    case laundry        = 3
    case tv             = 4
    case alarmSystem    = 5
    case office         = 6
    case balcony        = 7
    
    // 给Things添加响应的属性，这样的话就不需要一个个设置，直接让enum全部返回
    
    var title: String{
        // self 就是它判断的case
        switch self {
            case .pool          :return "pool"
            case .kitchen       :return "kitchen"
            case .wifi          :return "wifi"
            case .laundry       :return "laundry"
            case .tv            :return "tv"
            case .alarmSystem   :return "alarmSystem"
            case .office        :return "office"
            case .balcony       :return "balcony"
        }
    }
    
    var imageName:String{
        switch self{
            case .pool          :return "figure.pool.swim"
            case .kitchen       :return "fork.knife"
            case .wifi          :return "wifi"
            case .laundry       :return "washer"
            case .tv            :return "tv"
            case .alarmSystem   :return "checkerboard.shield"
            case .office        :return "pencil.and.ruler.fill"
            case .balcony       :return "building"
        }
    }
    
    var id:Int{
        return self.rawValue
    }
}

enum ListingType:Int,Codable,Identifiable,Hashable{
    case apartment
    case house
    case townHouse
    case villa
    
    var description:String{
        switch self{
        case .apartment :return "Apartment"
        case .house     :return "House"
        case .townHouse :return "TownHouse"
        case .villa     :return "Villa"
        }
    }
    var id:Int{
        return self.rawValue
    }
}


