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
    @State private var birds = ["鶏", "鳩", "雉"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("入れ替え可能なリスト")) {
                    // id指定をすること
                    ForEach(meats, id: \.self) { meat in
                        HStack {
                            Text(meat)
                            } .id(UUID())
                    }
                    .onMove(perform: rowReplace)
                }
                
                Section(header: Text("削除可能なリスト")) {
                    ForEach(birds, id: \.self) { bird in
                        HStack {
                            Text(bird)
                            } .id(UUID())
                    }
                .onDelete(perform: rowDelete)
                }
            }
            .navigationBarTitle("動作可能なリスト", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    
    func rowReplace(_ from: IndexSet, _ to: Int) {
        meats.move(fromOffsets: from, toOffset: to)
    }
    
    func rowDelete(offsets: IndexSet) {
        birds.remove(atOffsets: offsets)
    }
}

struct listReplacementView_Previews: PreviewProvider {
    static var previews: some View {
        listReplacementView()
    }
}
