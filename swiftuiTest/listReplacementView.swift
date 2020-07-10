//
//  listReplacementView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/10.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct listReplacementView: View {
    
    // @Stateの時はprivateをつけるのが推奨されている
    @State private var meats = ["鶏", "豚", "牛"]
    
    var body: some View {
        NavigationView {
            List {
                // id指定をすること
                ForEach(meats, id: \.self) { meat in
                    Text(meat)
                }
                .onMove(perform: rowReplace)
            }
            .navigationBarTitle("入れ替え可能なリスト", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func rowReplace(_ from: IndexSet, _ to: Int) {
        meats.move(fromOffsets: from, toOffset: to)
    }
}

struct listReplacementView_Previews: PreviewProvider {
    static var previews: some View {
        listReplacementView()
    }
}
