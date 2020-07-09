//
//  listTransitionView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/08.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

let fruits = ["リンゴ", "みかん", "ぶどう" ,"イチゴ"]

struct listTransitionView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("ContentViewに遷移", destination: ContentView())
                NavigationLink("imageViewに遷移", destination: imageView())
                NavigationLink("ListViewに遷移", destination: ListView())
                Section(header: Text("配列を使った遷移")) {
                    NavigationLink(fruits.first!, destination: Text("リンゴの画面"))
                }
                NavigationLink(fruits[1], destination: Text("みかんの画面"))
                .navigationBarTitle("Listで画面遷移", displayMode: .inline)
            }
        }
    }
}

struct listTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        listTransitionView()
    }
}
