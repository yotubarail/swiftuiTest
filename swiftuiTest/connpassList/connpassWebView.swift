//
//  connpassWebView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/28.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI
import WebKit

struct connpassWebView: View {
    
    var eventData: Event
    
    var body: some View {
        WebView(loadUrl: eventData.url)
        .navigationBarTitle(eventData.title)
    }
}

struct WebView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}

struct connpassWebView_Previews: PreviewProvider {
    static var previews: some View {
        connpassWebView(eventData: mockEventsData[0])
    }
}
