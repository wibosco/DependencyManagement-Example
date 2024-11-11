//
//  DependencyManagement_ExampleTests.swift
//  DependencyManagement-ExampleTests
//
//  Created by William Boles on 08/11/2024.
//

import XCTest

@testable import DependencyManagement_Example

final class DefaultDependencyContainerTests: XCTestCase {
    var sut: DependencyContainer!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        sut = DependencyContainer()
        
    }

    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }

   // MARK: - Tests
    
    func test_givenBuildersAreRegistered_whenAIsResolved_thenAIsReturned() throws {
        sut.registerDependencies()
        
        _ = try sut.resolve(for: A.self)
    }
    
    func test_givenBuildersAreRegistered_whenBIsResolved_thenBIsReturned() throws {
        sut.registerDependencies()
        
        _ = try sut.resolve(for: B.self)
    }
    
    func test_givenBuildersAreRegistered_whenCIsResolved_thenCIsReturned() throws {
        sut.registerDependencies()
        
        _ = try sut.resolve(for: C.self)
    }
    
    func test_givenBuildersAreRegistered_whenDIsResolved_thenDIsReturned() throws {
        sut.registerDependencies()
        
        _ = try sut.resolve(for: D.self)
    }
    
    func test_givenBuildersAreNotRegistered_whenAnyDependencyIsResolved_thenErrorIsThrown() throws {
        XCTAssertThrowsError(try sut.resolve(for: D.self)) { error in
            XCTAssertEqual(error as? DependencyContainerError, DependencyContainerError.builderNotRegistered)
        }
    }

}
