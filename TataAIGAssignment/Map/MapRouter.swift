//
//  MapRouter.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MapRouter: MapWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(_ coordinate:Coordinate,_ coordinateAll:[Coordinate] ) -> UIViewController {
        let view = MapViewController(nibName:"MapViewController", bundle: nil)
        let interactor = MapInteractor()
        let router = MapRouter()
        let presenter = MapPresenter(interface: view, interactor: interactor, router: router, coordinate:coordinate, coordinateAll: coordinateAll)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
