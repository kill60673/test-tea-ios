//
//  OrderDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/5/30.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var orderDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetailTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderDetailCell", for: indexPath)as!
        OrderDetailTableViewCell
        return cell
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
