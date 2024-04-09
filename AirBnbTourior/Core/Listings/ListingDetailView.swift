//
//  ListingDetail.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/5.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {

    
    @Environment(\.dismiss) var dismiss
    
    let listing:Listing
    
    // 设置地图显示的位置
    @State private var cameraPosition:MapCameraPosition
    
    init(listing:Listing){
        self.listing = listing
        
        let region = MKCoordinateRegion(
            //判断城市，Xcode会自动从你写好的Regions中读取经纬度信息
            center: listing.city == "los Angeles" ? .losAngeles : .miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    
    var body: some View {
        ScrollView{
            //Carouse
            
            //之所以要放进ZStack，是因为按钮要放置在轮播图上层
            ZStack(alignment:.topLeading){
                ListingImageCarouseView(listing: listing)
                    .frame(height: 270)
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32,height: 32)
                        }
                        //添加这个padding的目的是把返回按钮放到能看见的地方
                        .padding(32)
                }
            }
            //                .frame(minWidth:.infinity)
            
            VStack(alignment:.leading){
                //part 1
                HStack(alignment:.top){
                    //details
                    VStack(alignment: .leading,spacing: 7){
                        Text("\(listing.title)")
                            .fontWeight(.semibold)
                            .font(.title2)
                        HStack{
                            Image(systemName: "star.fill")
                                .fontWeight(.semibold)
                                .font(.footnote)
                            Text("\(listing.rating) -")
                                .fontWeight(.semibold)
                                .font(.footnote)
                            Text("28 reviews")
                                .underline()
                                .fontWeight(.semibold)
                                .font(.footnote)
                        }
                        Text("Miami Floard")
                            .fontWeight(.semibold)
                            .font(.footnote)
                    }
                    .frame(maxWidth:.infinity,alignment: .leading)
                    
                    Divider()
                        .foregroundColor(.black)
                    
                    // host into view
                }
                
                Divider()
                
                //part 2
                HStack{
                    VStack(alignment:.leading,spacing:7){
                        Text("Entire \(listing.type.description) hosted by\(listing.ownerName)")
                            .font(.headline)
                            .frame(width: 250,alignment: .leading)
                        
                        Text("John Smith")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("\(listing.numOfGuests) guests - \(listing.numOfBeds) beds - \(listing.numOfBethrooms) bethrooms")
                            .font(.caption)
                    }
                    .frame(width:290,alignment: .leading)
                    
                    Spacer()
                    VStack(alignment:.trailing){
                        Image("\(listing.ownerImageUrl)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 80)
                    }
                }
                
                Divider()
                
                //part 3
                //原有的硬编码改写成使用ForEach，然后换上我们写好的model里的数据接口
                VStack(alignment: .leading, spacing:10){
                    ForEach(listing.features){feature in
                    HStack{
                        Image(systemName: feature.imageName)
                        VStack(alignment:.leading){
                            Text("\(feature.title)")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("\(feature.subTile)")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.gray)
                        }
                    }
                    }
                    
//                    HStack{
//                        Image(systemName: "medal")
//                        VStack(alignment:.leading){
//                            Text("suportHost")
//                                .font(.footnote)
//                                .fontWeight(.semibold)
//                            Text("Check youself in with the keypad Check youself in with the keypad Check youself in with the keypad")
//                                .font(.caption)
//                                .fontWeight(.regular)
//                                .foregroundStyle(.gray)
//                        }
//                    }
                }
                .padding(.vertical,6)
                
                Divider()
                
                //part 4
                VStack(alignment:.leading){
                    Text("Where you'll sleep?")
                        .font(.title3)
                    
                    //showsIndicators  ????????????????????
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing:16){
                            // 改写
                            ForEach(1 ..< listing.numOfBedrooms,id: \.self){ bedroom in
                                VStack{
                                    Image(systemName: "bed.double")
                                    Text("bedroom \(bedroom)")
                                }
                                .frame(width: 120,height: 75)
                                .overlay{
                                    // 添加圆角矩形边框线
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(lineWidth:1.5)
                                        .foregroundColor(Color(.systemGray4))
                                        
                                        
                                }
                            }
                        }
                    }
                    //打开这个之后，动画会有一点点小区别，会完整显示一个小的page，不然就会弹回来
                    //不写的话，是可以随便拖动的
                    .scrollTargetBehavior(.paging)
                    
                }
                
                Divider()

                //part 5
                VStack(alignment:.leading,spacing:16){
                    Text("What this place offers?")
                        .font(.title3)
                    // 使用ForEach改成循环写法，取消硬编码
                    ForEach(listing.things){things in
                        HStack{
                            Image(systemName: things.imageName)
                            Text(things.title)
                                .font(.caption)
                        }
                    }
                }
                .padding(.horizontal,5)
                    
                Divider()
                
                //Map
                VStack(alignment: .leading,spacing:16) {
                    Text("Where you will be?")
                        .font(.title3)
                    Map(position: $cameraPosition)
                        .frame(height:200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                }

            }
            .padding()
       
        }
        // 隐藏底部的tabBar
        .toolbar(.hidden,for: .tabBar)
        // 忽略安全区域，全部显示
        .ignoresSafeArea()
        .padding(.bottom,40)
        .overlay(alignment: .bottom){
            VStack{
                Spacer()
                
                HStack{
                    VStack(alignment:.leading){
                        Text("$\(listing.pricePerNight)")
                            .font(.title3)
                        
                        Text("Total before taxes")
                            .font(.caption)
                        
                        Text("Oct 15-20")
                            .font(.caption)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Text("Reverse")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .frame(width:140,height:40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    
                }
                .padding(.horizontal,32)
                .padding(.vertical,-5)
                .background(.white)
                .frame(height: 10)
                
            }
            .frame(height:100)
            
        }
        
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listing[0])
}
