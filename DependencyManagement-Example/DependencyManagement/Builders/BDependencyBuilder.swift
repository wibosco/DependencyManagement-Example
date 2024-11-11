//
//  BDependencyBuilder.swift
//  DependencyManagement-Example
//
//  Created by William Boles on 08/11/2024.
//

import Foundation

struct BDependencyBuilder: DependencyBuilder {
    var type: B.Type = B.self
    
    // MARK: - Create
    
    func createInstance(with container: DependencyContainer) throws -> B {
        let c = try container.resolve(for: C.self)
        
        let b = B(c: c)
        
        return b
    }
}
