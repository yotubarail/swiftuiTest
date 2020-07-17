//
//  listUserDefaultsView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/17.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct listUserDefaultsView: View {
    
    @ObservedObject var useList = useUserDefaults()
          
    var body: some View {
        List {
            Section(header: Text("入れ替えも削除も可能なリスト")) {
                ForEach(useList.phones, id: \.self) { phone in
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
        }
        .navigationBarTitle("UserDefaultsを用いたリスト", displayMode: .inline)
        .navigationBarItems(leading: Button("データ消去") {
            self.useList.userDefaultsRemove()
            print("aaa")
        },trailing: EditButton())
    }
}

class useUserDefaults: ObservableObject {
    @Published public var phones = ["iPhone", "ZenFone", "Google Pixel"]
    
    func phoneReplace(_ from: IndexSet, _ to: Int) {
        phones.move(fromOffsets: from, toOffset: to)
        UserDefaults.standard.set(phones, forKey: "phoneRow")
    }
    
    func phoneDelete(offsets: IndexSet) {
        phones.remove(atOffsets: offsets)
        UserDefaults.standard.set(phones, forKey: "phoneRow")
    }
    
    func userDefaultsRemove() {
        UserDefaults.standard.removeObject(forKey: "phoneRow")
    }

}

struct listUserDefaultsView_Previews: PreviewProvider {
    static var previews: some View {
        listTransitionView()
    }
}
