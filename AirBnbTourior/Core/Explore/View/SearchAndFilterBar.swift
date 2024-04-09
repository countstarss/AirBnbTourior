//
//  SearchAndFilterBar.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/5.
//

import SwiftUI

struct SearchAndFilterBar: View {
    
    //想要实现的功能，如果当前是filtered的listing，那么搜索框里的文本应该是你输入进去的那个
    @Binding var location: String
    
//    @State var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            VStack(alignment:.leading,spacing: 2){
                Text(location.isEmpty ? "Where to go?" :location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Anywhere - Ant Week - Add Guest")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
            }
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            })
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        
        //这里画重点！！
        .overlay{
            // 添加边框线
            Capsule()
                .stroke(lineWidth:0.5)
                .foregroundColor(Color(.systemGray4))
                //添加阴影
                .shadow(color:.black,radius: 2)
        }
        .padding()
        
        Spacer()
    }
    
}

#Preview {
    SearchAndFilterBar(location: .constant("LA LA"))
}
