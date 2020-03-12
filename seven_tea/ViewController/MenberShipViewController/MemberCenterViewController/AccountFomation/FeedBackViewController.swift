//
//  FeedBackViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class FeedBackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var FeedBackTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 0
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedBackCell", for: indexPath)
        return cell
      }
}
