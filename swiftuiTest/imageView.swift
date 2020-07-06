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
        .scaledToFill()
        .frame(width: 300, height: 300)
        .clipShape(Circle())
    }
}

struct imageView_Previews: PreviewProvider {
    static var previews: some View {
        imageView()
    }
}
