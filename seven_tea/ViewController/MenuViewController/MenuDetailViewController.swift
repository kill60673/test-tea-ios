//
//  OrderDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/4/9.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var feedCollectionView: UICollectionView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var btClose: UIButton!
    @IBOutlet weak var btSizeM: UIButton!
    @IBOutlet weak var btSizeL: UIButton!
    @IBOutlet weak var btTemperatureHot: UIButton!
    @IBOutlet weak var btTemperatureCold: UIButton!
    @IBOutlet weak var btWholeSugar: UIButton!
    @IBOutlet weak var btLessSugar: UIButton!
    @IBOutlet weak var btHalfSugar: UIButton!
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

    var Size = ""
    var TemperatureHot = ""
    var Sugar = ""
    override func viewDidLoad() {
        btSizeL.oval_button(button: btSizeL)
        btSizeM.oval_button(button: btSizeM)
        btTemperatureHot.oval_button(button: btTemperatureHot)
        btTemperatureCold.oval_button(button: btTemperatureCold)
        btNoSugar.oval_button(button: btNoSugar)
        btHalfSugar.oval_button(button: btHalfSugar)
        btLessSugar.oval_button(button: btLessSugar)
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedlist.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as!
        FeedCollectionViewCell
        cell.btFeed.setTitle(feedlist[indexPath.row], for: .normal)
        cell.btFeed.oval_button(button: cell.btFeed)
        cell.btFeed.backgroundColor = UIColor.white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    @IBAction func brClose(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func btSizeM(_ sender: Any) {
        btSizeM.backgroundColor = UIColor.yellow
        btSizeL.backgroundColor = UIColor.white
        self.Size = "M"
    }
    @IBAction func btSizeL(_ sender: Any) {
        btSizeL.backgroundColor = UIColor.yellow
        btSizeM.backgroundColor = UIColor.white
        self.Size = "L"
    }
    @IBAction func btTemperatureHot(_ sender: Any) {
        btTemperatureHot.backgroundColor = UIColor.yellow
        btTemperatureCold.backgroundColor = UIColor.white
        self.TemperatureHot = "Hot"
    }
    @IBAction func btTemperatureCold(_ sender: Any) {
        btTemperatureCold.backgroundColor = UIColor.yellow
        btTemperatureHot.backgroundColor = UIColor.white
        self.TemperatureHot = "Cold"
    }
    @IBAction func btWholeSugar(_ sender: Any) {
        btWholeSugar.backgroundColor = UIColor.yellow
        btLessSugar.backgroundColor = UIColor.white
        btNoSugar.backgroundColor = UIColor.white
        btMicroSugar.backgroundColor = UIColor.white
        btHalfSugar.backgroundColor = UIColor.white
        self.Sugar = "WholeSugar"
    }

    @IBAction func btLessSugar(_ sender: Any) {
        btWholeSugar.backgroundColor = UIColor.white
               btLessSugar.backgroundColor = UIColor.yellow
               btNoSugar.backgroundColor = UIColor.white
               btMicroSugar.backgroundColor = UIColor.white
               btHalfSugar.backgroundColor = UIColor.white
               self.Sugar = "LessSugar"
    }
    @IBAction func btNoSugar(_ sender: Any) {
        btWholeSugar.backgroundColor = UIColor.white
               btLessSugar.backgroundColor = UIColor.white
               btNoSugar.backgroundColor = UIColor.yellow
               btMicroSugar.backgroundColor = UIColor.white
               btHalfSugar.backgroundColor = UIColor.white
               self.Sugar = "NoSugar"
    }
    @IBAction func btMicroSugar(_ sender: Any) {
        btWholeSugar.backgroundColor = UIColor.white
               btLessSugar.backgroundColor = UIColor.white
               btNoSugar.backgroundColor = UIColor.white
               btMicroSugar.backgroundColor = UIColor.yellow
               btHalfSugar.backgroundColor = UIColor.white
               self.Sugar = "MicroSugar"
    }
    @IBAction func btHalfSugar(_ sender: Any) {
        btWholeSugar.backgroundColor = UIColor.white
               btLessSugar.backgroundColor = UIColor.white
               btNoSugar.backgroundColor = UIColor.white
               btMicroSugar.backgroundColor = UIColor.white
               btHalfSugar.backgroundColor = UIColor.yellow
               self.Sugar = "HalfSugar"
    }
}
