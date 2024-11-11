//
//  BDependencyBuilder.swift
//  DependencyManagement-Example
//
//  Created by William Boles on 08/11/2024.
//

import Foundation

struct CDependencyBuilder: DependencyBuilder {
    var type: C.Type = C.self
    
    // MARK: - Create
    
    func createInstance(with container: DependencyContainer) throws -> C {
        C()
    }
}
