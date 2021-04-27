//
//  AppNavigationHandler.swift
//  TataAIGAssignment
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import Foundation
import UIKit

class AppNavigationHandler {
    
    static func removeBackButtonTitle(from: UIViewController?) {
        let emptyBackButton = UIBarButtonItem.init(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        from?.navigationController?.navigationBar.topItem?.backBarButtonItem = emptyBackButton
    }
    
    public static func goMapViewScreen(from:UIViewController, with coordinate: Coordinate?, coordinateAll:[Coordinate]?){
        if let coordinate = coordinate, let coordinateAll = coordinateAll{
        let vc = MapRouter.createModule(coordinate,coordinateAll)
        vc.hidesBottomBarWhenPushed = true
        let emptyBackButton = UIBarButtonItem.init(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        from.navigationController?.navigationBar.topItem?.backBarButtonItem = emptyBackButton
        from.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    public static func goListViewScreen(from:UIViewController){
    let vc = PioListRouter.createModule()
    vc.hidesBottomBarWhenPushed = true
    vc.navigationItem.setHidesBackButton(true, animated: true)
    from.navigationController?.pushViewController(vc, animated: true)
    }
}
