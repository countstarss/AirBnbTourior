//
//  ListingDetail.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/5.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            //Carouse
            
            //之所以要放进ZStack，是因为按钮要放置在轮播图上层
            ZStack(alignment:.topLeading){
                ListingImageCarouseView()
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
                        Text("Miami Florida")
                            .fontWeight(.semibold)
                            .font(.title2)
                        HStack{
                            Image(systemName: "star.fill")
                                .fontWeight(.semibold)
                                .font(.footnote)
                            Text("4.86 -")
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
                        Text("Entire Villa hosted by")
                            .font(.headline)
                            .frame(width: 250,alignment: .leading)
                        
                        Text("John Smith")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("4 guests - 4 beds - 3 beths")
                            .font(.caption)
                    }
                    .frame(width:290,alignment: .leading)
                    
                    Spacer()
                    VStack(alignment:.trailing){
                        Image("lucas")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 80)
                    }
                }
                
                Divider()
                
                //part 3
                VStack(alignment: .leading, spacing:10){
                    HStack{
                        Image(systemName: "medal")
                        VStack(alignment:.leading){
                            Text("Self Check-in")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Check youself in with the keypad")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.gray)
                        }
                    }
                    HStack{
                        Image(systemName: "medal")
                        VStack(alignment:.leading){
                            Text("suportHost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Check youself in with the keypad Check youself in with the keypad Check youself in with the keypad")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.gray)
                        }
                    }
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
                            ForEach(1 ..< 5,id: \.self){ bedroom in
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
                
                    HStack{
                        Image(systemName: "alarm")
                        Text("Alarm system")
                            .font(.caption)
                    }
                    HStack{
                        Image(systemName: "wifi")
                        Text("Wifi")
                            .font(.caption)
                    }
                    HStack{
                        Image(systemName: "rm.button.horizontal")
                        Text("balcony")
                            .font(.caption)
                    }
                    HStack{
                        Image(systemName: "dishwasher")
                        Text("laundry")
                            .font(.caption)
                    }
                    HStack{
                        Image(systemName: "sparkles.tv")
                        Text("TV")
                            .font(.caption)
                    }
                }
                .padding(.horizontal,5)
                    
                Divider()
                
                //Map
                VStack(alignment: .leading,spacing:16) {
                    Text("Where you will be?")
                        .font(.title3)
                    Map()
                        .frame(height:200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                }

            }
            .padding()
       
        }
        // 忽略安全区域，全部显示
        .ignoresSafeArea()
        .padding(.bottom,80)
        .overlay(alignment: .bottom){
            VStack{
                
                HStack{
                    VStack(alignment:.leading){
                        Text("$500")
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
            }
        }
    }
}

#Preview {
    ListingDetailView()
}
