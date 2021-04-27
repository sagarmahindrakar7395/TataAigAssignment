//
//  MapProtocols.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation

//MARK: Wireframe -
protocol MapWireframeProtocol: class {

}
//MARK: Presenter -
protocol MapPresenterProtocol: class {

    var interactor: MapInteractorInputProtocol? { get set }
    var coordinate: Coordinate {get set}
    func updateMapView()
}
//MARK: Interactor -
protocol MapInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol MapInteractorInputProtocol: class {

    var presenter: MapInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol MapViewProtocol: class {

    var presenter: MapPresenterProtocol?  { get set }
    func updateMapView(_ cordinates:[Coordinate]?,_ southwestCoordinate:Coordinate)

    /* Presenter -> ViewController */
}
