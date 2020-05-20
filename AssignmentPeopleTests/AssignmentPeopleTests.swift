//
//  AssignmentPeopleTests.swift
//  AssignmentPeopleTests
//
//  Created by Palak jain on 18/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import XCTest
@testable import AssignmentPeople

class AssignmentPeopleTests: XCTestCase {
  
  var controller = LunchViewController()
  override func setUp() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let lunchTabBar = storyboard.instantiateInitialViewController() as! UITabBarController
    let nav = lunchTabBar.viewControllers?.first
    controller = (nav as! UINavigationController).topViewController as! LunchViewController
    XCTAssertNotNil(controller.view)
  }
  
  func testcollectionViewDataSourceProtocol() {
    XCTAssertTrue(controller.conforms(to: UICollectionViewDataSource.self))
    XCTAssertTrue(controller.responds(to: #selector(controller.collectionView(_:numberOfItemsInSection:))))
    XCTAssertTrue(controller.responds(to: #selector(controller.collectionView(_:cellForItemAt:))))
  }
  
  func testcollectionview(){
    XCTAssertNotNil(controller.colView)
  }
  
  func testCollectionViewCell() {
    let indexPath = IndexPath(row: 0, section: 0)
    let cell = controller.collectionView(controller.colView, cellForItemAt: indexPath) as! LunchCollCell
    XCTAssertNotNil(cell)
    let view = cell.contentView
    XCTAssertNotNil(view)
  }
  
  func testCollectionViewCellHasReuseIdentifier() {
    let cell = controller.collectionView(controller.colView, cellForItemAt: IndexPath(row: 0, section: 0)) as? LunchCollCell
    let actualReuseIdentifer = cell?.reuseIdentifier
    let expectedReuseIdentifier = "cell"
    XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
  }
  
}

