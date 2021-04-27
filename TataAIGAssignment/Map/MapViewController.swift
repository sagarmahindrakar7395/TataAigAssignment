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
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        presenter?.updateMapView()
        setupTitle()
    }
    func setupTitle(){
        self.title = Constants.heading.mapHeading
    }
    //MARK: To show map on full screen -
    func updateMapView(_ cordinates:[Coordinate]?,_ southwestCoordinate:Coordinate){
        if let cordinates = cordinates, let lat = southwestCoordinate.latitude, let long = southwestCoordinate.longitude{
            let northEast = CLLocationCoordinate2D(latitude:Constants.P1Coordinates.latitude, longitude:Constants.P1Coordinates.longitude)
            let southWest = CLLocationCoordinate2D(latitude:lat, longitude:long)
            let bounds = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
            let update = GMSCameraUpdate.fit(bounds, withPadding: 50.0)
            DispatchQueue.main.async {
                self.mapView.moveCamera(update)
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
}


