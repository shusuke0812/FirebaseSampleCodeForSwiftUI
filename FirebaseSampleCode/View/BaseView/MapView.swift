//
//  MapView.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

struct MapView: View {
    
    @State private var text = ""
    @Binding var mapView: Bool
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                MapKit()
                Button(action: {
                    self.mapView.toggle()
                }) {
                    Text("リスト表示")
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 30, alignment: .center)
                        .padding(.init(top: 10, leading: 16, bottom: 10, trailing:  16))
                        //.overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 1))
                }
                .background(Color.white)
                .cornerRadius(.infinity)
                .padding()
                .compositingGroup()
                .shadow(color: Color.gray, radius: 2)
            }
            //.padding()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: ZStack {
                TextField("検索キーワードを入力", text: self.$text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.keyboardType(.asciiCapable)
                    .frame(width: UIScreen.main.bounds.width - 40)
                /* TODO:入力キャンセルボタン実装
                if self.text != "" {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "multiply.circle")
                            .frame(width: UIScreen.main.bounds.width - 40, alignment: .trailing)
                            .padding(.trailing, 15)
                    }
                }
                */
            })
        }
    }
}

/*
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
*/
