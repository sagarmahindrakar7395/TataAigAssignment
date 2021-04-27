//
//  RootViewController.swift
//  TataAIGAssignment
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        getMap()
    }
    
    func getMap(){
        AppNavigationHandler.goListViewScreen(from: self)
    }
}

