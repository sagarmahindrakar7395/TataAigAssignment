//
//  PioListInteractor.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class PioListInteractor: PioListInteractorInputProtocol {
    
        weak var presenter: PioListInteractorOutputProtocol?
        var networkManger = NetworkManger()

    func fetchData(completion: @escaping (MapModel) -> (), failure: @escaping (String) -> ()){
        networkManger.fetchData(url:nil,method:nil,completion: {[weak self] (response) in
        completion(response)
        }, failure: {[weak self] (err) in
            failure("Something went wrong. Please try again later.")
        })
}
    func fetchUpdateData(url: String, completion: @escaping (MapModel) -> (), failure: @escaping (String) -> ()) {
        networkManger.fetchData(url:url,method:nil,completion: {[weak self] (response) in
        completion(response)
        }, failure: {[weak self] (err) in
            failure("Something went wrong. Please try again later.")
        })
    }
}
