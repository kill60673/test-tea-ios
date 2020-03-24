//
//  NearbyStoresViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/24.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class NearbyStoresViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var nearbystores = [0,1,2,3,4]
    @IBOutlet weak var btCounty: UIButton!
    @IBOutlet weak var btRegion: UIButton!
    @IBOutlet weak var NearbystoresTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btCounty.customized_button(button: btCounty)
        btRegion.customized_button(button: btRegion)
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearbystores.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NearbyStoresCell", for: indexPath) as! NearbyStoresTableViewCell
        cell.lbAddress.text = "hello"
        return cell
    }
    
}
