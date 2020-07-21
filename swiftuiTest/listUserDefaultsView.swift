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
        },trailing: EditButton())
        .onAppear() {
            guard let phoneItem = UserDefaults.standard.array(forKey: "phoneKey") as? [String] else {
                return
            }
            self.useList.phones = phoneItem
        }
    }
}

class useUserDefaults: ObservableObject {
    
    let key = "phoneKey"
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
        
    }

    
}

struct listUserDefaultsView_Previews: PreviewProvider {
    static var previews: some View {
        listTransitionView()
    }
}
