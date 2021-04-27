//
//  PioListRouter.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class PioListRouter: PioListWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = PioListViewController(nibName: "PioListViewController", bundle: nil)
        let interactor = PioListInteractor()
        let router = PioListRouter()
        let presenter = PioListPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func goToDetailMapVC(_ coordinate:Coordinate,_ coordinateAll:[Coordinate],_ viewController:UIViewController ){
        AppNavigationHandler.goMapViewScreen(from:viewController, with: coordinate, coordinateAll: coordinateAll)
    }

}
