//
//  MapView.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

struct MapView: View {
    
    @Binding var mapView: Bool
    
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
    }
}

/*
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
*/
