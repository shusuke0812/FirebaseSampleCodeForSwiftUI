//
//  FormView.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
    @State private var url = "https://docs.google.com/document/d/1xwKhNVNW-CUuRFp_jk8vhMG1TaihEtrzbEM9RPy77Ac/edit"
    @State private var isPresented: Bool = false
    
    @State private var atmIndex = 0
    
    var atms = ["ゆうちょ銀行", "みずほ銀行", "三菱東京UFJ", "三井住友銀行"]
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section {
                        Picker(selection: $atmIndex, label: Text("ATM種別")) {
                            ForEach(0 ..< atms.count) {
                                Text(self.atms[$0]).tag($0)
                            }
                        }
                    }
                }
            }
            Spacer()
            Button(action: {
                // print("ボタンがタップされました")
                self.isPresented.toggle()
            }) {
                Text("利用規約")
            }.sheet(isPresented: $isPresented) {
                SafariView(url: URL(string: self.url)!)
            }
            Spacer()
        }
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
