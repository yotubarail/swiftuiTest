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
            Button("付け足す", action: useList.plus)
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
}

class UseUserDefaults: ObservableObject {
    
    let key = "phoneKey"
    let defaults = UserDefaults.standard
    
    let register: Void = UserDefaults.standard.register(defaults: ["phoneKey": ["iPhone", "ZenFone", "Google Pixel"]])


    @Published var userdefaults = UserDefaults.standard.stringArray(forKey: "phoneKey")
    
    func plus() {
        userdefaults! += ["DS"]
        defaults.set(userdefaults!, forKey: key)
    }
    
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

struct listUserDefaultsView_Previews: PreviewProvider {
    static var previews: some View {
        listTransitionView()
    }
}
