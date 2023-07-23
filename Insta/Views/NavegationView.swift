//
//  NavegationView.swift
//  Insta
//
//  Created by antuni gr on 21/07/23.
//

import SwiftUI

struct NavigationView: View {
    var body: some View{
        VStack{
            HStack{
                Button(action: {}){
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 40, height: 35)
                }
                .foregroundColor(.black)
                
                Spacer()
                Text("antunigram")
                    .font(Font.custom("fonte",size: 28))
                Spacer()
                
                Button(action: {}){
                    ImageView(imageName: "moca.jpg")
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 1)
                }
                .foregroundColor(.black)
              
            }
            .padding(.top)
            .padding(.leading)
            .padding(.trailing)
            
        }
    }
}

struct NavegationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
