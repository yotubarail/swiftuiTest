//
//  NumericsTextView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/10/30.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct NumericsTextView: View {
    @EnvironmentObject var observableValues: ObservableValues
    var body: some View {
        Text("\(observableValues.numerics)")
    }
}

struct NumericsTextView_Previews: PreviewProvider {
    static var previews: some View {
        NumericsTextView().environmentObject(ObservableValues())
    }
}
