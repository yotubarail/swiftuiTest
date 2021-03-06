//
//  ContentView.swift
//  swiftuiTest
//
//  Created by 滝浪翔太 on 2020/07/03.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                        Image("IMG_6599")
                            .resizable()  // サイズの変更を可能にする
//                            .scaledToFit()
                            .scaledToFill()
                            .clipped() //scaleToFillのときフレームで切り取る
                            .frame(width: 300, height: 300)
                            .clipShape(Circle()) // 円の形にする
                           
                        VStack {
                                    Text("Hello, World!")
                                        // 背景
//                                        .background(Color.blue)
//                                        .background(Color(red: 0, green: 100, blue: 0, opacity: 0.5))  RGBと透明度
                                        
                                        // 文字の色
                                        .foregroundColor(Color.pink)
                                        
                                        //　文字のサイズ
                                        .font(.system(size: 65))
                                    Text("下にテキストを置く")
                                        // 全体
                                        .padding(45)
                                        // .padding(.all, 45)
                                    
                                    /*上のみ
                                      .padding(.top, 45) */
                                        
                                    /*下のみ
                                        .padding(.bottom, 45) */
                                    
                                    /*上下
                                        .padding(.vertical, 45)
                                        .padding([.top, .bottom], 45)*/
                                    
                                    /*左のみ
                                        .padding(.leading, 45)*/
                                    
                                    /*右のみ
                                        .padding(.trailing, 45)*/
                                    
                                    /*左右
                                        .padding(.horizontal, 45)
                                        .padding([.leading, .trailing], 45)*/
                            
                                        // 背景色指定後にpaddingを設定でテキストの周りのみに背景が適用される
                                        .background(Color.white)
                            
                            
                                }
                    }
            // navigationBarのタイトルを設定（displayModeのデフォは.large）
            .navigationBarTitle("SwiftUI触ってみた", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

