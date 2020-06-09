//
//  CardView.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct CardView: View {
    
    @ObservedObject var atms = getAtmData()
    
    @Binding var searchedText: String
    // @Binding var listView: Bool
   
    // @State var favorite = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                if self.searchedText != "" {
                    if self.atms.datas.filter({$0.atmKind.lowercased().contains(self.searchedText.lowercased())}).count == 0 {
                        List {
                            Text("該当するATMが見つかりませんでした")
                        }
                    } else {
                        List(atms.datas.filter{$0.atmKind.lowercased().contains(self.searchedText.lowercased())}) {i in
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
                                        if i.favorite {
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.pink)
                                                .padding(.trailing, 10)
                                                .onTapGesture {
                                                    self.atms.updateData(id: i.id, favorite: false)
                                                }
                                        } else {
                                            Image(systemName: "heart")
                                                .padding(.trailing, 10)
                                                .onTapGesture {
                                                    self.atms.updateData(id: i.id, favorite: true)
                                                }
                                        }
                                        
                                    }
                                    Text(i.atmName)
                                    Text(i.atmAddress)
                                }
                            }
                            // カード型のUIに枠線を追加する
                            //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                            //.frame(minWidth: 150, minHeight: 180)
                            //.padding()
                        }
                    }
                } else {
                    List(atms.datas) {i in
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
                                    if i.favorite {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .padding(.trailing, 10)
                                            .onTapGesture {
                                                self.atms.updateData(id: i.id, favorite: false)
                                            }
                                    } else {
                                        Image(systemName: "heart")
                                            .padding(.trailing, 10)
                                            .onTapGesture {
                                                self.atms.updateData(id: i.id, favorite: true)
                                            }
                                    }
                                    
                                }
                                Text(i.atmName)
                                Text(i.atmAddress)
                            }
                        }
                        // カード型のUIに枠線を追加する
                        //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        //.frame(minWidth: 150, minHeight: 180)
                        //.padding()
                    }
                }
            }
            .onAppear() {
                self.atms.readData()
                
                // ListViewの区切り線を消す
                // UITableView.appearance().separatorStyle = .none
            }
            Button(action: {
                // self.listView.toggle()
            }) {
                Text("地図表示")
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
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(atms: .init(id: "1", iconImage: UIImage(named: "atm_test")!, atmKind: "ゆうちょ銀行", atmName: "府中清水が丘郵便局", atmAddress: "東京都府中市清水が丘2-13-12", favorite: false))
            .previewLayout(.sizeThatFits)
    }
}
*/
