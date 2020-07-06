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
        Image("IMG_6599")
        .resizable()
        .scaledToFit()
        .frame(width: 300, height: 300)
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
        .clipShape(RoundedRectangle(cornerRadius: 500))
        .cornerRadius(500)でいい気がする */
    }
}

struct imageView_Previews: PreviewProvider {
    static var previews: some View {
        imageView()
    }
}
