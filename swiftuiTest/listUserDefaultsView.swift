//
//  listUserDefaultsView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/17.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct listUserDefaultsView: View {
    
    @ObservedObject var useList = UseUserDefaults()
    @State var addPhone = ""
          
    var body: some View {
        List {
            Section(header: Text("入れ替えも削除も可能なリスト")) {
                ForEach(useList.userdefaults!, id: \.self) { phone in
                    HStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text(phone)
                    }.id(UUID())
                }
                .onMove(perform: useList.phoneReplace)
                .onDelete(perform: useList.phoneDelete)
            }
            TextField("テキストを入力", text: $addPhone,
            onCommit: {
                self.plusPhone()
                self.addPhone = ""
                
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .navigationBarTitle("UserDefaultsを用いたリスト", displayMode: .inline)
        .navigationBarItems(leading: Button("データ消去") {
            self.useList.userDefaultsRemove()
        },trailing: EditButton())
        .onAppear() {
            guard let phoneItem = UserDefaults.standard.array(forKey: "phoneKey") as? [String] else {
                return
            }
            self.useList.userdefaults! = phoneItem
        }
    }
    
    func plusPhone() {
        useList.userdefaults! += [addPhone]
        useList.defaults.set(useList.userdefaults!, forKey: useList.key)
    }
}

class UseUserDefaults: ObservableObject {

    let key = "phoneKey"
    let defaults = UserDefaults.standard

    let register: Void = UserDefaults.standard.register(defaults: ["phoneKey": ["iPhone", "ZenFone", "Google Pixel"]])


    @Published var userdefaults = UserDefaults.standard.stringArray(forKey: "phoneKey")

    func phoneReplace(_ from: IndexSet, _ to: Int) {
        userdefaults!.move(fromOffsets: from, toOffset: to)
        defaults.set(userdefaults!, forKey: key)
    }

    func phoneDelete(offsets: IndexSet) {
        userdefaults!.remove(atOffsets: offsets)
        defaults.set(userdefaults!, forKey: key)
    }

    func userDefaultsRemove() {
        defaults.removeObject(forKey: key)
        guard let phoneItem = defaults.stringArray(forKey: key) else {
            return
        }
        self.userdefaults! = phoneItem
    }


}

/* 配列をUserDefaultsの初期値として登録しない時のclassだが、消すと元の配列は表示できない
 View内のuserDefaults!をphonesに変え、List内のButtonをコメントアウトすること */

/* class UseUserDefaults: ObservableObject {

    let key = "phoneRow"
    let defaults = UserDefaults.standard

    @Published var phones = ["iPhone", "ZenFone", "Google Pixel"]

    func phoneReplace(_ from: IndexSet, _ to: Int) {
        phones.move(fromOffsets: from, toOffset: to)
        defaults.set(phones, forKey: key)
    }

    func phoneDelete(offsets: IndexSet) {
        phones.remove(atOffsets: offsets)
        defaults.set(phones, forKey: key)
    }

    func userDefaultsRemove() {
        defaults.removeObject(forKey: key)
        phones.removeAll()
    }

} */


struct listUserDefaultsView_Previews: PreviewProvider {
    static var previews: some View {
        listTransitionView()
    }
}
