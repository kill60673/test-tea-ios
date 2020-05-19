//
//

import Foundation
import UIKit

class MyFavoriteDrinkInfoAPI: NSObject {
    static let MyFavoriteDrinkInfoInstance = MyFavoriteDrinkInfoAPI()
    var myfavirutelist = [MyFavorite]()
    var newToken: String!
    func myFavoriteDrinkInfo(token: String) {

        let url = URL(string: ApiUrl.ApiUrlInstance.myFavoriteDrinkInfoUrl )!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, _ in

            let responseString = String(data: data!, encoding: .utf8)
            let httpStatus = response as! HTTPURLResponse
            print("為什麼999", httpStatus.allHeaderFields["Authorization"])
            if httpStatus.allHeaderFields["Authorization"] != nil {
                print("我有進來2")
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("tokennnnn", token)
                print("我有進來3")
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Info = try?
                decoder.decode(MyFavoriteInfoCodable.self, from: data) {
                if Info.result == 0 {
                    self.myfavirutelist.removeAll()
                    for result in Info.message! {
                        let myFavorite = MyFavorite(myFavoriteId: result.id, myFavoriteProductName: result.product_name, myFavoriteProductType: result.product_type, myFavoriteSize: result.size, myFavoriteSugar: result.sugar, myFavoriteTemperature: result.temperature, myFavoriteQuantity: result.quantity, myFavoriteTotalPrice: result.total_price, myFavoriteSinglePrice: result.single_price, myFavoriteStore: result.store, myFavoriteStoreId: result.store_id, myFavoriteName: result.name, myFavoriteAdd: result.add)
                        self.myfavirutelist.append(myFavorite)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(Info.message)")
                    }
                }
            } else {
                //主線程
                DispatchQueue.main.async {
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                }
            }
            //主線程
            DispatchQueue.main.async {
                //                UIViewController.removeSpinner(spinner: sv as! UIView)
                myFavoriteDrinkTableVIew.reloadData()
            }
        }
        task.resume()
    }

    func getCount() -> Int {
        return myfavirutelist.count
    }
    func getList() -> [MyFavorite] {
        return myfavirutelist
    }

}
