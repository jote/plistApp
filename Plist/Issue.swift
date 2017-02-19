//
//  Issue.swift
//  Plist
//
//  Created by konomi_ban on 2017/02/18.
//  Copyright © 2017年 konomi_ban. All rights reserved.
//

import Foundation

class Issue: NSObject {
    let id: Int
    var title: String
    var dueDate: Date
    
    init(id: Int, title: String, dueDate:Date) {
        self.id = id
        self.title = "title"
        self.dueDate = Date()
    }
}
