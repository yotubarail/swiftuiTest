//
//  BasicListView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/22.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct BasicListView: View {
    
    let logos: [Logo] = [
        Logo(image: "airplane", text: "飛行機"),
        Logo(image: "car", text: "自動車"),
        Logo(image: "paperplane", text: "紙飛行機")
    ]
    
    var body: some View {
        List(logos) { logo in
            BasicRowView(logo: logo)
        }
    .navigationBarTitle("Rowを別のViewで作成")
    }
}

struct BasicListView_Previews: PreviewProvider {
    static var previews: some View {
        BasicListView()
    }
}
