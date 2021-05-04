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
    var mapModel = MapModel()
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
    
    //MARK: To update URL's P2 Coordinates -
    func fetchUpdateData(_ coordinate:Coordinate){
        if let lat = coordinate.latitude, let long = coordinate.longitude{ let url = "https://fake-poi-api.mytaxi.com/?p1Lat=18.910000&p1Lon=72.809998&p2Lat=\(lat)&p2Lon=\(long)"
        interactor?.fetchUpdateData(url:url,completion: {[weak self] (response) in
            if let weakSelf = self{
                weakSelf.mapModel = response
                weakSelf.filterCoordinates(response,coordinate)
            }
        }, failure: {[weak self] (response) in
            self?.view?.showError()
        })
    }
    }
    
    func filterCoordinates(_ response:MapModel?,_ coordinate:Coordinate){
        if let response = response{
        var coordinateArr = [Coordinate]()
            if let polist = response.poiList{
            for value in polist{
                if let coordinate = value.coordinate{
                    coordinateArr.append(coordinate)
                }
            }
                self.coordinateAll = coordinateArr
                view?.updateMapView(coordinateArr,coordinate)
            }
        }
    }
   
}
