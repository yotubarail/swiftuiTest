//
//  SliderIView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/10/30.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct SliderIView: View {
    @EnvironmentObject var observableValues: ObservableValues
    var body: some View {
        Slider(value: $observableValues.numerics, in: 0...400)
            .padding(.horizontal, 30)
    }
}

struct SliderIView_Previews: PreviewProvider {
    static var previews: some View {
        SliderIView().environmentObject(ObservableValues())
    }
}
