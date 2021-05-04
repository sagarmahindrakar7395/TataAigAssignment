//
//  MapViewController.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import GoogleMaps
import UIKit

class MapViewController: UIViewController, MapViewProtocol, GMSMapViewDelegate {
    
    var presenter: MapPresenterProtocol?
    @IBOutlet weak var mapView: GMSMapView!
    var check = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateMapView()
        setupTitle()
    }
    func setupTitle(){
        self.title = Constants.heading.mapHeading
    }
    //MARK: To update dataList -
    func updateData(){
        DispatchQueue.main.async {[weak self] in
    }
    }
    //MARK: To show Errors -
    func showError(){
        let alert = UIAlertController(title:Constants.errors.networkTitle, message:Constants.errors.networkTitle, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async(execute: {
        self.present(alert, animated: true, completion: nil)
        })
    }
    //MARK: To show map on full screen -
    func updateMapView(_ cordinates:[Coordinate]?,_ southwestCoordinate:Coordinate){
        if let cordinates = cordinates, let lat = southwestCoordinate.latitude, let long = southwestCoordinate.longitude{
            let northEast = CLLocationCoordinate2D(latitude:Constants.P1Coordinates.latitude, longitude:Constants.P1Coordinates.longitude)
            let southWest = CLLocationCoordinate2D(latitude:lat, longitude:long)
            let bounds = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
            let update = GMSCameraUpdate.fit(bounds, withPadding: 50.0)
            DispatchQueue.main.async {
                self.check = false
                if !self.check{
                    self.mapView.clear()
                self.mapView.moveCamera(update)
                }
                for x in cordinates {
                    if let lat = x.latitude, let long = x.longitude{
                        let marker = GMSMarker()
                        marker.position = CLLocationCoordinate2DMake(lat,long)
                        marker.map = self.mapView
                    }
                }
            }
        }
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        if check{
        let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        var coordinate = Coordinate()
        coordinate.latitude = latitude
        coordinate.longitude = longitude
        presenter?.fetchUpdateData(coordinate)
            check = !check
        }else{
            check = !check
        }
    }
}


