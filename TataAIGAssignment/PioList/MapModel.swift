//
//  MapModel.swift
//  TataAIGAssignment
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import Foundation

import Foundation

// MARK: - Welcome
struct MapModel: Codable {
    var poiList: [PoiList]?
}

// MARK: - PoiList
struct PoiList: Codable {
    var id: Int?
    var coordinate: Coordinate?
    var fleetType: FleetType?
    var heading: Double?
}

// MARK: - Coordinate
struct Coordinate: Codable {
    var latitude, longitude: Double?
}

enum FleetType: String, Codable {
    case pooling = "POOLING"
    case taxi = "TAXI"
}
