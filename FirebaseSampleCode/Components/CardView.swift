//
//  CardView.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    
    @ObservedObject var atms = getAtmData()
    /*
    let atm: Atm
    
    init(atm: Atm) {
        self.atm = atm
    }
     */
    
    var body: some View {
        VStack {
            if atms.datas.count != 0 {
                ScrollView(.vertical, showsIndicators: false) {
                        ForEach(atms.datas) {i in
                            HStack {
                                AnimatedImage(url: URL(string: i.iconImage)!)
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                    .shadow(color: .gray, radius: 1, x:0, y:0)
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(i.atmKind)
                                        Spacer()
                                        Image(systemName: "heart")
                                            .padding(.trailing, 10)
                                    }
                                    Text(i.atmName)
                                    Text(i.atmAddress)
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                            .frame(minWidth: 150, minHeight: 180)
                            .padding()
                        }
                }
            }
        }
    }
}

/*
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(atms: .init(id: "1", iconImage: UIImage(named: "atm_test")!, atmKind: "ゆうちょ銀行", atmName: "府中清水が丘郵便局", atmAddress: "東京都府中市清水が丘2-13-12", favorite: false))
            .previewLayout(.sizeThatFits)
    }
}
 */
