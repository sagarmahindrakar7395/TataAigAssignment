//
//  PioListPresenter.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class PioListPresenter: PioListPresenterProtocol, PioListInteractorOutputProtocol {
    

    weak private var view: PioListViewProtocol?
    var interactor: PioListInteractorInputProtocol?
    private let router: PioListWireframeProtocol

    init(interface: PioListViewProtocol, interactor: PioListInteractorInputProtocol?, router: PioListWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    var mapModel = MapModel()
    var coordinatsAll = [Coordinate]()
    var firstCoardinate = Coordinate()

    func fetchData(){
        interactor?.fetchData(completion: {[weak self] (response) in
            if let weakSelf = self{
                weakSelf.mapModel = response
                weakSelf.firstCoardinate.latitude = Constants.P1Coordinates.latitude
                weakSelf.firstCoardinate.longitude = Constants.P1Coordinates.longitude
                weakSelf.filterCoordinates(response, weakSelf.firstCoardinate)
                weakSelf.updateView()
            }
        }, failure: {[weak self] (response) in
            self?.view?.showError()
        })
    }
    
    //MARK: To update URL's P2 Coordinates -
    func fetchUpdateData(_ coordinate:Coordinate){
        if let lat = coordinate.latitude, let long = coordinate.longitude{ let url = "https://fake-poi-api.mytaxi.com/?p1Lat=18.910000&p1Lon=72.809998&p2Lat=\(lat)&p2Lon=\(long)"
        interactor?.fetchUpdateData(url:url,completion: {[weak self] (response) in
            if let weakSelf = self{
                weakSelf.mapModel = response
                weakSelf.updateView()
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
                self.coordinatsAll = coordinateArr
                view?.updateMapView(coordinateArr,coordinate)
            }
        }
    }
    
    func goToDetailMapVC(_ coordinate:Coordinate){
        guard let vc = view as? UIViewController else {
            view?.showError()
            return
        }
        router.goToDetailMapVC(coordinate,coordinatsAll,vc)
    }
    
    func updateView() {
        view?.updateData()
    }
    
    func showError(){
        view?.showError()
    }
}
