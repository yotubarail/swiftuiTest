//
//  ListView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/06.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct ListView: View {
let number = ["1", "2", "3", "4"]
    
    var body: some View {
        List {
            Text("リスト")
            Text("2行目")
            Image("logo")
            HStack() {
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("画像とテキストを表示")
            }
            Section(header: Text("セクション")){
                Text("簡単")
            }
            Section(header: Text("数字を表示")) {
                ForEach(0..<number.count) { index in
                    Text(self.number[index])
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
