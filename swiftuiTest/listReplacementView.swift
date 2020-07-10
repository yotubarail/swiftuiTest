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
    @State private var phones = ["iPhone", "ZenFone", "Google Pixel"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("入れ替え可能なリスト")) {
                    // id指定をすること
                    ForEach(meats, id: \.self) { meat in
                        HStack {
                            Text(meat)
                        }
                        .id(UUID())
                    }
                    .onMove(perform: rowReplace)
                }
                
                Section(header: Text("削除可能なリスト")) {
                    ForEach(birds, id: \.self) { bird in
                        HStack {
                            Text(bird)
                        }
                        .id(UUID())
                    }
                    .onDelete(perform: rowDelete)
                }
                
                Section(header: Text("入れ替えも削除も可能なリスト")) {
                    ForEach(phones, id: \.self) { phone in
                        HStack {
                            Image("logo")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(phone)
                        }
                        .id(UUID())
                    }
                    .onMove(perform: phoneReplace)
                    .onDelete(perform: phoneDelete)
                }
                
                
            }
            .navigationBarTitle("動作可能なリスト", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    // 入れ替え可能なリスト
    func rowReplace(_ from: IndexSet, _ to: Int) {
        meats.move(fromOffsets: from, toOffset: to)
    }
    
    // 削除可能なリスト
    func rowDelete(offsets: IndexSet) {
        birds.remove(atOffsets: offsets)
    }
    
    // 入れ替えも削除も可能なリスト
    func phoneReplace(_ from: IndexSet, _ to: Int) {
        phones.move(fromOffsets: from, toOffset: to)
    }
    func phoneDelete(offsets: IndexSet) {
        phones.remove(atOffsets: offsets)
    }
}

struct listReplacementView_Previews: PreviewProvider {
    static var previews: some View {
        listReplacementView()
    }
}
