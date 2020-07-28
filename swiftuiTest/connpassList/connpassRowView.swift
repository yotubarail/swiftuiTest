//
//  connpassRowView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/27.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct connpassRowView: View {
    
    var eventData: Event
    let formatter = ISO8601DateFormatter()

    var body: some View {
        
        HStack {
            Text(eventData.date)
            VStack(alignment: .leading) {
                Text(eventData.title)
                    .font(.system(size: 20))
                    .padding(.bottom,20)
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(Color.red)
                    Text(eventData.place)
                    .font(.system(size: 15))
                }
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("参加:" + String(eventData.people) + "人")
//                Text("定員:" + String(eventData.limit))
            }
        }
    }
}


struct connpassRowView_Previews: PreviewProvider {
    static var previews: some View {
        connpassRowView(eventData: mockEventsData[0])
    }
}
