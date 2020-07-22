//
//  BasicRowView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/22.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct BasicRowView: View {
    
    var logo: Logo
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: logo.image)
            Spacer()
            Text(logo.text)
            Spacer()
        }
    }
}

struct Logo: Identifiable {
    var id = UUID()
    var image: String
    var text: String
}
