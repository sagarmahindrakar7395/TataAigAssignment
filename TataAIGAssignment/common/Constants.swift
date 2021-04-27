//
//  Constants.swift
//  TataAIGAssignment
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import Foundation
import UIKit

struct Constants
{

    //String constants
    struct strings
    {
        static let poCellNibName = "PoListTableViewCell"
    }

    //String URL constants
    struct stringURL
    {
        static let aPIForMapViewData = "https://fake-poi-api.mytaxi.com/?p1Lat=18.910000&p1Lon=72.809998&p2Lat=18.5204&p2Lon=73.8567"
    }

    //Error contsants
    struct errors
    {
        static let networkTitle = "Oops"
        static let networkError = "something went wrong"
    }
    
    //Heading contsants
    struct heading
    {
        static let listHeading = "Taxi List"
        static let mapHeading = "Map"
    }
    
    struct P1Coordinates
    {
        static let latitude = 18.910000
        static let longitude = 72.809998
    }
    
    struct Radius
    {
        static let btnRadius = 8.0
        static let viewRadius = 12.0
    }
    
    static let kSize16AppFontMedium = UIFont(name: "AvenirNext-Medium", size: 16.0)

}
