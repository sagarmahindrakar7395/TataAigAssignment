//
//  NetworkManager.swift
//  TataAIGAssignment
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import Foundation

class NetworkManger {
    
    typealias APIResponseClosure = (MapModel) -> ()
    typealias APIFailResponseClosure = (String) -> ()
    
    static let sharedInstance = NetworkManger()
    
    func fetchData(url:String?,method:String?,completion: @escaping APIResponseClosure,failure: @escaping APIFailResponseClosure){
        if let url = url{
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(MapModel.self, from: data!)
                    completion(responseModel)
                } catch {
                    failure(Constants.errors.networkError)
                }
            }).resume()
        } else {
            var request = URLRequest(url: URL(string: Constants.stringURL.aPIForMapViewData)!)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
                do {
                    let jsonDecoder = JSONDecoder()
                    if let data = data{
                        let responseModel = try jsonDecoder.decode(MapModel.self, from: data)
                    completion(responseModel)
                    }else{
                        failure(Constants.errors.networkError)
                    }
                } catch {
                    failure(Constants.errors.networkError)
                }
            }).resume()
        }
    }
}




