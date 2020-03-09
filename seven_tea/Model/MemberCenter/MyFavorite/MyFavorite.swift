//
//  MyFavorite.swift
//  seven_tea
//
//

import Foundation
import UIKit

class MyFavorite: NSObject {
    var myFavoriteId = Int()
    var myFavoriteProductName = String()
    var myFavoriteProductType = String()
    var myFavoriteSize = String()
    var myFavoriteSugar = String()
    var myFavoriteTemperature = String()
    var myFavoriteQuantity = Int()
    var myFavoriteTotalPrice = Int()
    var myFavoriteSinglePrice = Int()
    var myFavoriteStore = String()
    var myFavoriteStoreId = String()
    var myFavoriteName = String()
    var myFavoriteAdd = String()
    
    init(myFavoriteId :Int, myFavoriteProductName : String , myFavoriteProductType : String ,myFavoriteSize : String ,myFavoriteSugar : String ,myFavoriteTemperature : String ,myFavoriteQuantity : Int , myFavoriteTotalPrice : Int , myFavoriteSinglePrice :Int ,myFavoriteStore : String , myFavoriteStoreId :String , myFavoriteName : String , myFavoriteAdd :String) {
        self.myFavoriteId = myFavoriteId
        self.myFavoriteProductType = myFavoriteProductType
        self.myFavoriteProductName = myFavoriteProductName
        self.myFavoriteSize = myFavoriteSize
        self.myFavoriteSugar = myFavoriteSugar
        self.myFavoriteTemperature = myFavoriteTemperature
        self.myFavoriteQuantity = myFavoriteQuantity
        self.myFavoriteTotalPrice = myFavoriteTotalPrice
        self.myFavoriteStore = myFavoriteStore
        self.myFavoriteStoreId = myFavoriteStoreId
        self.myFavoriteName = myFavoriteName
        self.myFavoriteAdd = myFavoriteAdd
    }
    func getMyFavirite(){
        
    }
}
