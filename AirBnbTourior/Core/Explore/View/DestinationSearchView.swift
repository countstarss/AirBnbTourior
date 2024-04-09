//
//  DestinationSearchView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/6.
//

import SwiftUI
import DataDetection


// 通过一个枚举类型来管理所有的状态，而不是写三个类似这样的语句，true和false的切换很麻烦
// @State private var showDestinationSearchView = false
enum DestinationSearchOption{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {

    //引入Binding
    @Binding var show:Bool
    
    // 用于搜索功能
    @ObservedObject var viewModel = ExploreViewModel(service: ExploreService())

    //为方便取出输入框中的内容，创建一个私有变量
    //@State private var destination = ""
    //这里的destination换用viewModel中的destination
    
    // 设置状态变量对应的enum,三个状态同一时间只需要一个打开，所以这样的话只赋值一个就够了
    @State private var selectOption:DestinationSearchOption = .location
    
    // 创建接收开始日期和结束日期的私有变量
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    // DatePicker isFoucsed
    @State private var isFocused:Bool = true
    
    // number of guests
    @State private var numGuests:Int = 0
    
    


    
    
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    //给按钮添加功能，切换状态，返回上一页面
                    //给这个动作添加上动画，使用withAnimation,参数 ：.snappy
                    withAnimation(.snappy) {
                        show.toggle()
                        viewModel.updateListingForLocation()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                .padding()
                
                Spacer()
                
                // when the destination is not empty,show the clear button
                if !viewModel.searchLocation.isEmpty{
                    Button("Clear"){
                        // clear button
                        viewModel.searchLocation = ""
                        //在点击clear按钮之后，更新列表
//                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                }
                
            }
            
            // destination textField
            VStack(alignment:.leading){
                if selectOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destinations",text:
                                    $viewModel.searchLocation)
                            .font(.subheadline)
//                            .fontWeight(.light)
//                            .foregroundStyle(.gray)
                            // 给文本输入框添加提交事件
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                // 搜索之后，切换视图
                                show.toggle()
                            }
                    }
                    .frame(height: 40)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            //stroke 参数：lineWidth 用来设置边框线
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color(.systemGray3))
                    }
                    //在这里添加点击动作，切换selectOption
                    
                }else{
                    CollapsedPickerView(title: "where", description: "select location")
//                        .onTapGesture {
//                            withAnimation {
//                                selectOption = .location
//                            }
//                        }
                }
            }
            .modifier(CollapsedDestinationViewModifier())
            .onTapGesture {
                withAnimation {
                    selectOption = .location
                }
            }
         
            //这里复用之前已经写过的组件，选中之后，点击Extract subview
            // data selection view

            VStack(alignment:.leading){
                if selectOption == .dates{
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
//                            .datePickerStyle(.graphical)
                        
                        Divider()
                        
                        DatePicker("To",selection: $endDate, displayedComponents: .date)
//                            .datePickerStyle(.graphical)
//                            .datePickerStyle(WheelDatePickerStyle())
                    }
                    
                }else{
                    CollapsedPickerView(title: "when", description: "select dates")
                }
            }
            .modifier(CollapsedDestinationViewModifier())
            //在这里添加点击动作，切换selectOption
            .onTapGesture {
                withAnimation {
                    selectOption = .dates
                }
            }

            // num guest view
            
            VStack(alignment:.leading){
                if selectOption == .guests{
                    Text("who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        // 在这里加一个guard，如果numGuests不符合这个条件，就return空，也不会出现报错的情况
                        guard numGuests >= 0 else {return }
                        numGuests -= 1
                    }
                }else{
                    CollapsedPickerView(title: "who", description: "add guests")
                }
            }
            .modifier(CollapsedDestinationViewModifier())
            //在这里添加点击动作，切换selectOption
            .onTapGesture {
                withAnimation {
                    selectOption = .guests
                }
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    //Binding
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsedDestinationViewModifier:ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(radius: 10)
        
        
    }
}

struct CollapsedPickerView: View {
    //新建两个字符串常量，可以传入ExtractedView中，用于不同的用途
    let title:String
    let description:String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .frame(height: 25)
            .padding(.horizontal)
        }
        //这里的style新建了一个modifier来使代码更加简介
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .padding()
//        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
