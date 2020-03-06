//
//

import Foundation
import UIKit



class MyFavoriteDrinkInfoAPI: NSObject {
    static let MyFavoriteDrinkInfoInstance = MyFavoriteDrinkInfoAPI()

    func MyFavoriteDrinkInfo(Token: String) {

        let url = URL(string: ApiUrl.ApiUrlInstance.myFavoriteDrinkInfoUrl )!

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(Token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, _ in

            let responseString = String(data: data!, encoding: .utf8)
            let httpStatus = response as? HTTPURLResponse

            print(responseString)

            //檢查Token是否要刷新
            if httpStatus!.allHeaderFields["Authorization"] as? String ?? "" != "" {
                UserInfo.UserInfoInstance.update(oldToken: Token, newToken: httpStatus!.allHeaderFields["Authorization"] as? String ?? "")
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Info = try?
                decoder.decode(MyFavoriteInfoCodable.self, from: data) {
                if Info.result == 0 {
                    myFavoriteId.removeAll()
                    myFavoriteProductName.removeAll()
                    myFavoriteProductType.removeAll()
                    myFavoriteSize.removeAll()
                    myFavoriteSugar.removeAll()
                    myFavoriteTemperature.removeAll()
                    myFavoriteQuantity.removeAll()
                    myFavoriteTotalPrice.removeAll()
                    myFavoriteSinglePrice.removeAll()
                    myFavoriteStore.removeAll()
                    myFavoriteStoreId.removeAll()
                    myFavoriteName.removeAll()
                    myFavoriteAdd.removeAll()

                    for result in Info.message! {
                        myFavoriteId.append(result.id)
                        myFavoriteProductName.append(result.product_name)
                        myFavoriteProductType.append(result.product_type)
                        myFavoriteSize.append(result.size)
                        myFavoriteSugar.append(result.sugar)
                        myFavoriteTemperature.append(result.temperature)
                        myFavoriteQuantity.append(result.quantity)
                        myFavoriteSinglePrice.append(result.single_price)
                        myFavoriteTotalPrice.append(result.total_price)
                        myFavoriteStore.append(result.store)
                        myFavoriteStoreId.append(result.store_id)
                        myFavoriteName.append(result.name)
                        myFavoriteAdd.append(result.add)
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
                MyFavoriteDrinkTableVIew.reloadData()
            }
        }
        task.resume()

    }

}
