//
//  ContentView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/03.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .background(Color.blue)
                .foregroundColor(Color.pink)
                .font(Font.system(size: 65))
            Text("下にテキストを置く")
                .padding(45)
//                .padding(.top, 45)
//                .padding(.bottom, 45)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

