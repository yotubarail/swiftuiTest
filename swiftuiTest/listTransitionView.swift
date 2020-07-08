//
//  listTransitionView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/08.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct listTransitionView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("ContentViewに遷移", destination: ContentView())
                NavigationLink("imageViewに遷移", destination: imageView())
                NavigationLink("ListViewに遷移", destination: ListView())
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
