//
//  ListControllerTest.swift
//  GetirTodoTests
//
//  Created by kishor garkal on 13/04/22.
//

import XCTest
@testable import GetirTodo

class ListControllerTest: XCTestCase {

    private var viewModel = ListViewModel()
    var viewControllerUnderTest: ListController!
    
    override func setUp() {
           super.setUp()
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ListController") as? ListController
           
           // in view controller, menuItems = ["one", "two", "three"]
           self.viewControllerUnderTest.loadView()
           self.viewControllerUnderTest.viewDidLoad()
       }
    

      
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasATableView() {
            XCTAssertNotNil(viewControllerUnderTest.tableView)
        }
    
    func testTableViewHasDelegate() {
         XCTAssertNotNil(viewControllerUnderTest.tableView.delegate)
     }
     
     func testTableViewConfromsToTableViewDelegateProtocol() {
         XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
         XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:commit:forRowAt:))))
     }
     
     func testTableViewHasDataSource() {
         XCTAssertNotNil(viewControllerUnderTest.tableView.dataSource)
     }
     
     func testTableViewConformsToTableViewDataSourceProtocol() {
         XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
         XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.numberOfSections(in:))))
         XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
         XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
     }

     func testTableViewCellHasReuseIdentifier() {
         let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
         let actualReuseIdentifer = cell.reuseIdentifier
         let expectedReuseIdentifier = "listItemCell"
         XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
     }

     func testTableCellHasCorrectLabelText() {
         let cell0 = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
         XCTAssertEqual(cell0.textLabel?.text, viewModel.listItems[0].name ?? "")

         let cell1 = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: IndexPath(row: 1, section: 0))
         XCTAssertEqual(cell1.textLabel?.text, viewModel.listItems[1].name ?? "")

         let cell2 = viewControllerUnderTest.tableView(viewControllerUnderTest.tableView, cellForRowAt: IndexPath(row: 2, section: 0))
         XCTAssertEqual(cell2.textLabel?.text, viewModel.listItems[2].name ?? "")
     }

}
