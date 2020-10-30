//
//  VarTextView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/10/30.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct VarTextView: View {
    @EnvironmentObject var observableText: ObservableText
    var body: some View {
        Text(observableText.text)
    }
}

struct VarTextView_Previews: PreviewProvider {
    static var previews: some View {
        VarTextView().environmentObject(ObservableText())
    }
}
