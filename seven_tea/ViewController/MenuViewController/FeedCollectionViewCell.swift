//
//  FeedCollectionViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/4/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

var addcolor = ""
class FeedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var btFeed: UIButton!
    @IBAction func btfeed(_ sender: Any) {
        if btFeed.backgroundColor == UIColor.yellow {
            btFeed.backgroundColor = UIColor.white
            addcolor = "white"
        } else if btFeed.backgroundColor == UIColor.white {
            btFeed.backgroundColor = UIColor.yellow
            addcolor = "yellow"
        }
    }
}
