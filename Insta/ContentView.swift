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
                CardView()
                
                        
        }
    }
}
    
    

    struct CardView: View{
        var body: some View{
            VStack{
                HStack{
                    Image(uiImage:#imageLiteral(resourceName: "sir-simo-zEQZuReSPHE-unsplash.jpg"))
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(width: 36, height: 36)
                    
                    VStack(alignment: .leading){
                        Text("jhon_")
                            .font(.footnote).fontWeight(.bold)
                        HStack{
                            Text("London,England")
                                .font(.footnote).fontWeight(.light)
                            Spacer()
                            Text("2 minutes ago")
                                .font(.footnote).fontWeight(.light)
                        }
                    }
                }
                
                Image(uiImage:#imageLiteral(resourceName: "sir-simo-zEQZuReSPHE-unsplash.jpg"))
                    .resizable()
                    .frame(width: 380 ,height: 380)
                    .shadow(color: Color("DefaultShadow"), radius: 3, x: 1, y: 2)
                
                HStack(spacing:30){
                    Button(action: {}){
                        HStack{
                            Image(systemName: "heart")
                                .font(Font.headline.weight(.semibold))
                            Text("19").font(.caption)
                        }
                        .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {}){
                        HStack{
                            Image(systemName: "bubble.right")
                                .font(Font.headline.weight(.semibold))
                            Text("19").font(.caption)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(.top)
                
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
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
