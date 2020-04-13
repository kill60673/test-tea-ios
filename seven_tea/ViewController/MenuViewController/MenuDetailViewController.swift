//
//  OrderDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/4/9.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var btClose: UIButton!
    @IBOutlet weak var btSizeM: UIButton!
    @IBOutlet weak var btSizeL: UIButton!
    @IBOutlet weak var btTemperatureHot: UIButton!
    @IBOutlet weak var btTemperatureCold: UIButton!
    @IBOutlet weak var btWholeSugar: UIButton!
    @IBOutlet weak var btLessSuger: UIButton!
    @IBOutlet weak var btHalfSuger: UIButton!
    @IBOutlet weak var btMicroSugar: UIButton!
    @IBOutlet weak var btNoSugar: UIButton!
    @IBOutlet weak var btPlus: UIButton!
    @IBOutlet weak var btLess: UIButton!
    @IBOutlet weak var btAddShopingcar: UIButton!
    @IBOutlet weak var btMyFavourite: UIButton!
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var lbTotalAmount: UILabel!
    @IBOutlet weak var lbFixedTemperature: UILabel!
    @IBOutlet weak var btNormalTemperature: UIButton!
    @IBOutlet weak var btTemperature: UIButton!
    @IBOutlet weak var btHot: UIButton!
    @IBOutlet weak var btLessIce: UIButton!
    @IBOutlet weak var btMicroIce: UIButton!
    @IBOutlet weak var btNoIce: UIButton!
    
    override func viewDidLoad() {
        btSizeL.oval_button(button: btSizeL)
        btSizeM.oval_button(button: btSizeM)
        btTemperatureHot.oval_button(button: btTemperatureHot)
        btTemperatureCold.oval_button(button: btTemperatureCold)
        btNoSugar.oval_button(button: btNoSugar)
        btHalfSuger.oval_button(button: btHalfSuger)
        btLessSuger.oval_button(button: btLessSuger)
        btMicroSugar.oval_button(button: btMicroSugar)
        btWholeSugar.oval_button(button: btWholeSugar)
        btAddShopingcar.customized_button(button: btAddShopingcar)
        btMyFavourite.customized_button(button: btMyFavourite)
        lbFixedTemperature.oval_label(label: lbFixedTemperature)
        btNormalTemperature.oval_button(button: btNormalTemperature)
        btTemperature.oval_button(button: btTemperature)
        btHot.oval_button(button: btHot)
        btLessIce.oval_button(button: btLessIce)
        btMicroIce.oval_button(button: btMicroIce)
        btNoIce.oval_button(button: btNoIce)
        super.viewDidLoad()
        view?.backgroundColor = UIColor(white: 1, alpha: 0)
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return feedlist.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as!
        FeedCollectionViewCell
        cell.btFeed.setTitle(feedlist[indexPath.section], for: .normal)
        cell.btFeed.oval_button(button: cell.btFeed)
        return cell
    }
    @IBAction func brClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
