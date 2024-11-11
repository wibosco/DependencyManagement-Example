//
//  ABuilder.swift
//  DependencyManagement-Example
//
//  Created by William Boles on 08/11/2024.
//

import Foundation

struct ADependencyBuilder: DependencyBuilder {
    var type: A.Type = A.self
    
    // MARK: - Create
    
    func createInstance(with container: DependencyContainer) throws -> A {
        let b = try container.resolve(for: B.self)
        let c = try container.resolve(for: C.self)
        
        let a = A(b: b,
                  c: c)
        
        return a
    }
}
