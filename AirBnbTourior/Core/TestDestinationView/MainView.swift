//
//  Main.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/6.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(spacing:30){
                    ForEach(0 ... 10,id:\.self) { listing in
                        ListingItemView()
                            .frame(height: 330)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }
                }
                
            }.navigationDestination(for: Int.self) { listing in
                ListingDetailView()
                    .navigationBarBackButtonHidden()
            }
            
        }
        
    }
}

#Preview {
    MainView()
}
