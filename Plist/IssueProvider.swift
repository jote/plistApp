//
//  IssueProvider.swift
//  Plist
//
//  Created by konomi_ban on 2017/02/18.
//  Copyright © 2017年 konomi_ban. All rights reserved.
//

import Foundation


class IssueProvider: UserDefaults {

    func save(issueList:[Issue]) {
        let row = issueList.map { ["id": $0.id,
                                   "dueDate": $0.dueDate,
                                   "title": $0.title] as NSDictionary
            }
        self.set(row, forKey: "issueList")
    }
    
    func findAll() -> Dictionary<Int, Issue> {
        return self.getFromPlist()
    }
    
    func find(id: Int) -> Issue {
        return self.getFromPlist()[id]!
    }
    
    private func getFromPlist() -> Dictionary<Int, Issue> {
        let issueList = self.object(forKey: "issueList") as? [NSDictionary] ?? []
        
        var list = Dictionary<Int, Issue>()
        for issue in issueList {
            if let id = issue["id"] as? Int, let dueDate = issue["dueDate"],let title = issue["title"] {
                let entity = Issue.init(id: id, title:title as! String, dueDate: dueDate as! Date)
                list[id] = entity
            }

        }
        
        return list
    }
    
}
