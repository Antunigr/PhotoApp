//
//  ImageView.swift
//  Insta
//
//  Created by antuni gr on 21/07/23.
//
	
import SwiftUI

struct ImageView: View {

    var imageName: String = "cara"
    var body: some View {
        
        Image(uiImage: UIImage(named: imageName) ?? UIImage()).resizable()
                    
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
