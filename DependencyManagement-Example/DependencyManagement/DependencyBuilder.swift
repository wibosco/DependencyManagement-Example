//
//  DependencyBuilder.swift
//  DependencyManagement-Example
//
//  Created by William Boles on 08/11/2024.
//

import Foundation

protocol DependencyBuilder {
    associatedtype T
    
    var type: T.Type { get }
    
    func createInstance(with container: DependencyContainer) throws -> T
}

