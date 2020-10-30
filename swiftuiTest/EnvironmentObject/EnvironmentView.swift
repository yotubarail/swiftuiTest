//
//  EnvironmentView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/10/30.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct EnvironmentView: View {
    var body: some View {
        VStack {
            VStack {
                SliderIView()
                NumericsTextView()
            }.environmentObject(ObservableValues())
            VStack {
                VarTextView()
                EnterTextView()
            }.environmentObject(ObservableText())
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
    }
}
