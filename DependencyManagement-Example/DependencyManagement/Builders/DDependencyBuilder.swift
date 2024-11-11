//
//  BDependencyBuilder.swift
//  DependencyManagement-Example
//
//  Created by William Boles on 08/11/2024.
//

import Foundation

struct DDependencyBuilder: DependencyBuilder {
    var type: D.Type = D.self
    
    // MARK: - Create
    
    func createInstance(with container: DependencyContainer) throws -> D {
        D()
    }
}
