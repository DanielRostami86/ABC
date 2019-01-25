//
//  ABCEngineeringTests.swift
//  ABCEngineeringTests
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import XCTest
@testable import ABCEngineering

class ABCEngineeringTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testArticle(){
        
        let ar = Article(title: "Daniel", synopsis: "synopsis", href: "https://www.google.com", publishedDate: Date())
        let vm = cellArticlesViewModel(data: ar)
        XCTAssertEqual("Daniel", vm.title)
        XCTAssertEqual("synopsis", vm.synopsis)
        XCTAssertEqual("https://www.google.com", vm.href)

    }
   
    func testArticleLoader(){
        
        let exp = expectation(description: "Loading articles")

        ArticleLoader.shared.load { article, error in
            
            exp.fulfill()

            if let uArticles = article {

                print(uArticles.count)
                XCTAssert(true)
            }else{
                XCTAssert(false)
            }
        }
        wait(for: [exp], timeout: 3)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
