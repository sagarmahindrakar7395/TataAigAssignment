//
//  PioListProtocols.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation
import UIKit

//MARK: Wireframe -
protocol PioListWireframeProtocol: class {
    func goToDetailMapVC(_ coordinate:Coordinate,_ coordinateAll:[Coordinate],_ viewController:UIViewController )

}
//MARK: Presenter -
protocol PioListPresenterProtocol: class {

    var interactor: PioListInteractorInputProtocol? { get set }
    var mapModel: MapModel {get set}
    var firstCoardinate: Coordinate {get set}
    func fetchData()
    func fetchUpdateData(_ coordinate:Coordinate)
    func goToDetailMapVC(_ coordinate:Coordinate)
}

//MARK: Interactor -
protocol PioListInteractorOutputProtocol: class {
    /* Interactor -> Presenter */
}

protocol PioListInteractorInputProtocol: class {

    var presenter: PioListInteractorOutputProtocol?  { get set }
    func fetchData(completion: @escaping (MapModel) -> (),failure: @escaping (String)-> ())
    func fetchUpdateData(url:String,completion: @escaping (MapModel) -> (),failure: @escaping (String)-> ())

    /* Presenter -> Interactor */
}

//MARK: View -
protocol PioListViewProtocol: class {

    var presenter: PioListPresenterProtocol?  { get set }
    func showError()
    func updateData()
    func updateMapView(_ cordinates:[Coordinate]?,_ southwestCoordinate:Coordinate)

    /* Presenter -> ViewController */
}
