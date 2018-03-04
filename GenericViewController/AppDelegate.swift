//
//  AppDelegate.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let address = AddressEntity()
        
        let cityPickerVC = CityResultPickerVC { [weak self] (city) in
            address.city = city
            
            let streetPickerVC = StreetResultPickerVC { (street) in
                address.street = street
                
                let housePickerVC = HouseResultPickerVC { (house) in
                    address.house = house
                    
                    debugPrint(address.city)
                    debugPrint(address.street)
                    debugPrint(address.house)
                }
                
                self?.window?.rootViewController = housePickerVC
            }
            
            self?.window?.rootViewController = streetPickerVC
        }
        
        
        let navigationController = UINavigationController(rootViewController: cityPickerVC)
        window?.rootViewController = navigationController
        
        return true
    }
}

