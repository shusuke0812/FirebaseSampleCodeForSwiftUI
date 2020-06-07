//
//  ContentView.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            CardView(searchedText: $text)
                .padding()
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
