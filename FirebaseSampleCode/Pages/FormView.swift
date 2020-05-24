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
    
    
    var body: some View {
        Button(action: {
            // print("ボタンがタップされました")
            self.isPresented.toggle()
        }) {
            Text("利用規約")
        }.sheet(isPresented: $isPresented) {
            SafariView(url: URL(string: self.url)!)
        }
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
