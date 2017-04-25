//
//  containerViewController.swift
//  MoreTableViewTestForMultiData
//
//  Created by mac on 2017/4/25.
//  Copyright © 2017年 VictorBasic. All rights reserved.
//

import UIKit

class containerViewController: UIViewController {
var data = ["A","B","C"]
    var data2 = ["A","B","C","D"]
    var sendTag = 10
    @IBOutlet weak var showdetail: UITableView!
    
    @IBOutlet weak var viewThree: UIView!
    @IBAction func buttonForData(_ sender: UIButton) {
        
        switch (sender.tag) {
        case 10:
            data = ["A","B","C"]
            sendTag = sender.tag
            print(sendTag)
            self.showdetail.reloadData()
            
        default:
            data2 = ["A","B","C","D"]
            sendTag = sender.tag
            self.showdetail.reloadData()

        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.showdetail.dataSource = self
        self.showdetail.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension containerViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "閃光鳥"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("HEEEEEE")
        switch (sendTag){
        case 10:
            return data.count
            print("HERE ")

        default:
            
        return data2.count
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        switch (sendTag) {
        case 10:
            
                cell.textLabel?.text = data[indexPath.row]
                
        
            return cell
        default:
            cell.textLabel?.text =  data2[indexPath.row]
            return cell

        }

        

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0  && sendTag == 10{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            performSegue(withIdentifier: "showOne", sender: Any.self)
        }else if indexPath.row == 0 && sendTag == 20{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            performSegue(withIdentifier: "showTwo", sender: Any.self)

        }else if indexPath.row == 1 && sendTag == 10{
            performSegue(withIdentifier: "showThree", sender: Any.self)

        }
        print("EE")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOne"{
            if let vc = segue.destination as? OneViewController{
                vc.view.backgroundColor = UIColor.red

            }
        }else if segue.identifier == "showTwo"{
            
            
            
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
            
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = CGRect(x: 0, y: 0, width: self.containerViewController.frame.size.width, height: self.containerViewController.frame.size.height)
            self.containerViewController.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)

            self.addChildViewController(popOverVC)
               let view = UIView(frame:  CGRect(x: 67, y: 462, width: 97, height: 95))
//                popOverVC.view.frame = view

            self.view.addSubview(view)
            popOverVC.didMove(toParentViewController: self)

//            let vc : ViewController? = (segue.destination as? ViewController)
//            vc?.view.backgroundColor = UIColor.gray
        }else if segue.identifier == "showThree"{
            let vc : ViewController? = (segue.destination as? ViewController)
            let viewByCode = UIView(frame:  CGRect(x: 67, y: 462, width: 97, height: 95))

            vc?.view.addSubview(viewByCode)

        }
    }

}
