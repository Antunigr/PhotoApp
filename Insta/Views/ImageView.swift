//
//  ImageView.swift
//  Insta
//
//  Created by antuni gr on 21/07/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        
        Image(uiImage:#imageLiteral(resourceName: "cara2.jpg"))
            .resizable()
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
