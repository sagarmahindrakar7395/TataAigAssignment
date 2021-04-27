//
//  TataAIGAssignmentTests.swift
//  TataAIGAssignmentTests
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import XCTest
@testable import TataAIGAssignment

class TataAIGAssignmentTests: XCTestCase {

    func testMapHeading(){
        let heading = Constants.heading.mapHeading
        XCTAssertEqual(heading, "Map")
    }
    
    func testListHeading(){
        let heading = Constants.heading.listHeading
        XCTAssertEqual(heading, "Taxi List")
    }

}
