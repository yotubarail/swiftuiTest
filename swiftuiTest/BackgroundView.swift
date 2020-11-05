//
//  BackgroundView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/11/05.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Text("Hello, World!")
//            .background(Color.green)
//            .background(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.5))
//            .background(Color(hue: 0.5, saturation: 0.5, brightness: 1, opacity: 0.5))
            .background(Color.color)
    }
}

extension Color {
    static let color = Color("Color")
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
