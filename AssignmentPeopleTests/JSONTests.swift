//
//  AssignmentPeopleTests.swift
//  AssignmentPeopleTests
//
//  Created by Palak jain on 18/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//
import XCTest

@testable import AssignmentPeople

class JSONTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  func testFromJsonFile(){
    
    if let path = Bundle.main.path(forResource: "Lunch", ofType: "json"){
      
      do {
        guard let jsonString = try? String(contentsOfFile: path, encoding: .isoLatin1) else {
          fatalError("Unable to convert Lunch.json to String")
        }
        
        print("The JSON string is: \(jsonString)")
        
        guard let jsonData = jsonString.data(using: .utf8) else {
          fatalError("Unable to convert Lunch.json to Data")
        }
        
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any] else {
          fatalError("Unable to convert Lunch.json to JSON dictionary")
        }
        let actualResponse = RootModel(fromDictionary: jsonDictionary )
        XCTAssertEqual(actualResponse.restaurants.count, 15)
        XCTAssertEqual(actualResponse.restaurants[0].name, "Hopdoddy Burger Bar")
        XCTAssertEqual(actualResponse.restaurants[0].category.description, "Burgers")
        XCTAssertEqual(actualResponse.restaurants[0].contact.phone.description, "9723872337")
        XCTAssertEqual(actualResponse.restaurants[0].location.country, "United States")
        XCTAssertEqual(actualResponse.restaurants[0].location.state,"TX")
      }
    }
  }
  
  
}

