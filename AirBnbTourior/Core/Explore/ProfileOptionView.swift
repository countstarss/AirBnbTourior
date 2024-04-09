//
//  ProfileOptionView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/7.
//

import SwiftUI

struct ProfileOptionView: View {
    let imageName:String
    let title:String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                
                Text(title)
                    .font(.subheadline)
                Spacer()
                
                Image(systemName: "chevron.right")
                
            }
            Divider()
        }
    }
}

#Preview {
    ProfileOptionView(imageName: "gear", title: "Setting")
}
