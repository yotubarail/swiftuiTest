//
//  connpassListView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/27.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct connpassListView: View {
    
//    let events: [Event] = mockEventsData
     @ObservedObject var fetcher = StudyGroupEventFetcher()
    
    var body: some View {
        List(fetcher.eventData) { event in
            NavigationLink(destination: connpassWebView(eventData: event)){
                connpassRowView(eventData: event)
            }
        }
    .navigationBarTitle("connpass検索結果")
    }
}

struct connpassListView_Previews: PreviewProvider {
    static var previews: some View {
        connpassListView()
    }
}