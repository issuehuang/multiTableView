//
//  ViewController.swift
//  MoreTableViewTestForMultiData
//
//  Created by mac on 2017/4/25.
//  Copyright © 2017年 VictorBasic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTableView: UIView!
    
    @IBOutlet weak var oneTableView: UIView!
    @IBOutlet weak var twoTableView: UIView!
    @IBAction func hideAndShow(_ sender: Any) {
        if dataTableView.isHidden == false{
        dataTableView.isHidden = true
        }else{
        dataTableView.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oneTableView.isHidden = true
        self.twoTableView.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

