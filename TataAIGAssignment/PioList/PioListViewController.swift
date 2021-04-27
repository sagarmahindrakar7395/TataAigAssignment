//
//  PioListViewController.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import GoogleMaps
import UIKit

class PioListViewController: UIViewController, PioListViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: GMSMapView!
    var presenter: PioListPresenterProtocol?
    var camera = GMSCameraPosition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
        registerCell()
        setupTitle()
    }
    
    func registerCell(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PoListTableViewCell", bundle: nil), forCellReuseIdentifier: "PoListTableViewCell")
    }
    func setupTitle(){
        self.title = Constants.heading.listHeading
    }
    //MARK: To update map -
    func updateMapView(_ cordinates:[Coordinate]?,_ southwestCoordinate:Coordinate){
        if let cordinates = cordinates, let lat = southwestCoordinate.latitude, let long = southwestCoordinate.longitude{
            let northEast = CLLocationCoordinate2D(latitude:Constants.P1Coordinates.latitude, longitude:Constants.P1Coordinates.longitude)
            let southWest = CLLocationCoordinate2D(latitude:lat, longitude:long)
            let bounds = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
            let update = GMSCameraUpdate.fit(bounds, withPadding:50.0)
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
    //MARK: To update dataList -
    func updateData(){
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadSections([0], with:UITableView.RowAnimation.middle)
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
}
extension PioListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.mapModel.poiList?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:Constants.strings.poCellNibName) as! PoListTableViewCell
       // cell.infoLabel.text = presenter?.mapModel.poiList?[indexPath.row].fleetType?.rawValue
        if let info = presenter?.mapModel.poiList?[indexPath.row].fleetType?.rawValue{
            cell.displayFleetInfo(info)
        }
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    //MARK: To update Selected Item -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let coordinate = presenter?.mapModel.poiList?[indexPath.row].coordinate{
            presenter?.fetchUpdateData(coordinate)
        }
    }
}

//MARK: To see detail map view on full screen -
extension PioListViewController: DetailMapDelegate{
    func detailMapClicked(_ tag: Int) {
        if let coordinate = presenter?.mapModel.poiList?[tag].coordinate{
            presenter?.goToDetailMapVC(coordinate)
        }
    }
}

extension UITableView {
    func reloadData(with animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}
