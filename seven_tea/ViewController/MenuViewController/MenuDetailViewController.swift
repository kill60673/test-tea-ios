//
//  OrderDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/4/9.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController {
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
    @IBOutlet weak var btWhiteTapioca: UIButton!
    @IBOutlet weak var btTaroTapioca: UIButton!
    @IBOutlet weak var btBlackTapiock: UIButton!
    @IBOutlet weak var btPudding: UIButton!
    @IBOutlet weak var btGrass: UIButton!
    @IBOutlet weak var btAiyu: UIButton!
    @IBOutlet weak var btCoconut: UIButton!
    @IBOutlet weak var btAgar: UIButton!
    @IBOutlet weak var btPlus: UIButton!
    @IBOutlet weak var btLess: UIButton!
    @IBOutlet weak var btAddShopingcar: UIButton!
    @IBOutlet weak var btMyFavourite: UIButton!
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var lbTotalAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = UIColor(white: 1, alpha: 0)
        // Do any additional setup after loading the view.
    }
    @IBAction func brClose(_ sender: Any) {
        dismiss(animated: true)
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
