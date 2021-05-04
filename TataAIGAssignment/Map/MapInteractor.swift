//
//  MapInteractor.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class MapInteractor: MapInteractorInputProtocol {

    weak var presenter: MapInteractorOutputProtocol?
    var networkManger = NetworkManger()

    func fetchUpdateData(url: String, completion: @escaping (MapModel) -> (), failure: @escaping (String) -> ()) {
        networkManger.fetchData(url:url,method:nil,completion: {[weak self] (response) in
        completion(response)
        }, failure: {[weak self] (err) in
            failure("Something went wrong. Please try again later.")
        })
    }
}
