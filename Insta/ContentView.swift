//
//  ContentView.swift
//  Insta
//
//  Created by antuni gr on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                NavigationBarView()
                Spacer()
                
                
                        
        }
    }
}
    
    
    struct NavigationBarView: View {
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
                    Text("Instagram")
                        .font(Font.custom("fonte",size: 28))
                    Spacer()
                    
                    Button(action: {}){
                        Image(uiImage: #imageLiteral(resourceName: "howen-IuizZEHWDDg-unsplash.jpg"))
                            .resizable()
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 1)
                    }
                    .foregroundColor(.black)
                  
                }
                .padding()
                
                
            }
        }
    }
}
            
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
