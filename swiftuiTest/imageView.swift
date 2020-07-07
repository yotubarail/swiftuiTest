//
//  imageView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/06.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct imageView: View {
    var body: some View {
        Image("IMG_7310")
        .resizable()
        .scaledToFill()
        .frame(width: 350, height: 200)
        .clipped()
           
           /* 円
        .clipShape(Circle()) */
            
          /* カプセル型
        .clipShape(Capsule()) */
            
           /* 四角形
        .clipShape(Rectangle()) */
            
           /* 楕円
        .clipShape(Ellipse()) */
        
        /* 丸角四角形
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .cornerRadius(50)でいい気がする */
        
            /* Imageでmask
        .mask(
            Image(systemName: "paperplane.fill")
                .font(.system(size: 150))
                .frame(width: 0)
        ) */
        
            /*Textでmask
        .mask(
            Text("SwiftUI")
                .font(.system(size: 90, weight: .heavy))
                .frame(width: 0)
        ) */
    }
}

struct imageView_Previews: PreviewProvider {
    static var previews: some View {
        imageView()
    }
}
