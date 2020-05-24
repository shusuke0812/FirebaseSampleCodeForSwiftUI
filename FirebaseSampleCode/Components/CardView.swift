//
//  CardView.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    struct Input: Identifiable {
        let id: UUID = UUID()
        let iconImage: UIImage
        let atmKind: String
        let atmName: String
        let atmAddress: String
        let favorite: Bool
    }
    
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    var body: some View {
        HStack {
            Image(uiImage: input.iconImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(color: .gray, radius: 1, x:0, y:0)
            VStack {
                HStack {
                    Text(input.atmKind)
                    Spacer()
                    Image(systemName: "heart")
                }
                Text(input.atmName)
                Text(input.atmAddress)
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
        .frame(minWidth: 150, minHeight: 180)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(input: .init(iconImage: UIImage(named: "atm_test")!, atmKind: "ゆうちょ銀行", atmName: "府中清水が丘郵便局", atmAddress: "東京都府中市清水が丘2-13-12", favorite: false))
            .previewLayout(.sizeThatFits)
    }
}
