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

    @IBOutlet var CountyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btCounty.customized_button(button: btCounty)
        btRegion.customized_button(button: btRegion)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(CountyView)
        CountyView.translatesAutoresizingMaskIntoConstraints = false
        CountyView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        CountyView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 10).isActive = true
        CountyView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -10).isActive = true
        let c = CountyView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 128)
        c.identifier = "bottom"
        c.isActive = true
        
        CountyView.layer.cornerRadius = 10
        super.viewWillAppear(animated)
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
    @IBAction func btCounty(_ sender: Any) {
        for c in view.constraints{
            if c.identifier == "bottom"{
                c.constant = -100
                break
            }
        }
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
        print("有案")
    }
    @IBAction func doneClick(_ sender: Any) {
    }
    
}
