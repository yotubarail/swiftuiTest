//
//  ListView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/06.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            Text("リスト")
            Text("2行目")
            Image("logo")
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
