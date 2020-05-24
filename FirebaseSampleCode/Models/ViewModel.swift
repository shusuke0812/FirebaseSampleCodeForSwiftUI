//
//  ViewModel.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/5/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct Atm: Identifiable {
    // let id: UUID = UUID()
    let id: String
    let iconImage: String
    let atmKind: String
    let atmName: String
    let atmAddress: String
    let favorite: Bool
}

class getAtmData: ObservableObject {
    @Published var datas = [Atm]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("atms").addSnapshotListener {(snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges {
                let id = i.document.documentID
                let iconImage = i.document.get("iconImage") as! String
                let atmKind = i.document.get("atmKind") as! String
                let atmName = i.document.get("atmName") as! String
                let atmAddress = i.document.get("atmAddress") as! String
                let favorite = i.document.get("favorite") as! Bool
                
                self.datas.append(Atm(id: id, iconImage: iconImage, atmKind: atmKind, atmName: atmName, atmAddress: atmAddress, favorite: favorite))
            }
        }
    }
}
