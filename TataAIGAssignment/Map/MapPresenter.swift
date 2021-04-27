//
//  MapPresenter.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class MapPresenter: MapPresenterProtocol, MapInteractorOutputProtocol {
    
    weak private var view: MapViewProtocol?
    var interactor: MapInteractorInputProtocol?
    private let router: MapWireframeProtocol
    var coordinate: Coordinate
    var coordinateAll:[Coordinate]

    init(interface: MapViewProtocol, interactor: MapInteractorInputProtocol?, router: MapWireframeProtocol, coordinate:Coordinate,coordinateAll:[Coordinate] ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.coordinate = coordinate
        self.coordinateAll = coordinateAll
    }
    
    func updateMapView(){
        view?.updateMapView(coordinateAll,coordinate)
    }
   
}
