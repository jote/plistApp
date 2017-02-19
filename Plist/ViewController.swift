//
//  ViewController.swift
//  Plist
//
//  Created by konomi_ban on 2017/02/18.
//  Copyright © 2017年 konomi_ban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

//        FileManagerを使ってDocument ディレクトリをURLオブジェクトの配列で取得
        let fManager = FileManager()
        let documents = fManager.urls(for: .documentDirectory, in: .userDomainMask)
        print(documents)
//        FileManager以外にも使える 下記はPathがStringで返ってくる
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(documentPath)
        
//        保存するファイルのURLオブジェクトを作る
        let filename =  "test.txt"
        let targetFile = documents[0].appendingPathComponent(filename)

//        保存するデータを作る
        let dic = "hoge"
        if fManager.fileExists(atPath: targetFile.path) {
            try! fManager.removeItem(at: targetFile)
        }
        fManager.createFile(atPath: targetFile.path, contents: dic.data(using: .utf8), attributes: nil)
    
//        Issue オブジェクトをPlistに保存、取り出しをする
        let issue = Issue(id: 1, title: "test", dueDate: Date())
        let provider = IssueProvider()
        provider.save(issueList: [issue])
        
        let issues = provider.findAll()
        print(issues[1]!.id)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

