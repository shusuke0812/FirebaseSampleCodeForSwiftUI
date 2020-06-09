//
//  HomeView.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewChangedButton = true
    
    
    var body: some View {
        TabView {
            if viewChangedButton {
                ListView(listView: $viewChangedButton)
                    .tabItem {
                        VStack {
                            Image(systemName: "mappin.circle")
                            Text("検索")
                        }
                }.tag(1)
            } else {
                MapView(mapView: $viewChangedButton)
                    .tabItem {
                        VStack {
                            Image(systemName: "mappin.circle")
                            Text("検索")
                        }
                }.tag(2)
            }
            FormView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.and.pencil")
                        Text("投稿")
                    }
            }.tag(3)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
