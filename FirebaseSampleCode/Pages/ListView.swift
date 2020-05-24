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
            ScrollView(showsIndicators: false) {
                Text("card UI")
                // CardView()
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: HStack {
                TextField("検索キーワードを入力", text: $text, onCommit: {
                    // 編集完了後に呼ばれるクロージャー
                    print("テキスト入力")
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.asciiCapable)
                    .frame(width: UIScreen.main.bounds.width - 40)
            })
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
