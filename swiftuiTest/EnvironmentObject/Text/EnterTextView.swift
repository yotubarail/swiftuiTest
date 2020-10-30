//
//  EnterTextView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/10/30.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct EnterTextView: View {
    @EnvironmentObject var observableText: ObservableText
    var body: some View {
        TextField("入力", text: $observableText.text)
            .background(Color.red)
    }
}

struct EnterTextView_Previews: PreviewProvider {
    static var previews: some View {
        EnterTextView().environmentObject(ObservableText())
    }
}
