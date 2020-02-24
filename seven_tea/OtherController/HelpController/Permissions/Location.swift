//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/2/19.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
class Location: UIViewController {
    var locationManager: CLLocationManager!
    func getLocation() {
        self.locationManager = CLLocationManager()
        // 開啟背景更新(預設為 false)
        self.locationManager?.allowsBackgroundLocationUpdates = true
        // 不間斷的在背景更新(預設為 true)
        self.locationManager?.pausesLocationUpdatesAutomatically = false
        // 詢問使用者是否在背景也可取用其位置的隱私
        self.locationManager?.requestAlwaysAuthorization()
    }
}

extension ViewController: CLLocationManagerDelegate {
    // 更新位置
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations.first!)")
    }
}
