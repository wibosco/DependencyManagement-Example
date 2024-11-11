//
//  DependencyContainer.swift
//  DependencyManagement-Example
//
//  Created by William Boles on 08/11/2024.
//

import Foundation

enum DependencyContainerError: Error, Equatable {
    case builderNotRegistered
    case wrongTypeBuilt
}

protocol DependencyContainer {
    func register(_ builder: any DependencyBuilder)
    func resolve<T>(for: T.Type) throws -> T
}

class DefaultDependencyContainer: DependencyContainer {
    private var builders: [String: any DependencyBuilder] = [:]
       
    // MARK: - Register
    
    func registerDependencies() {
        register(ADependencyBuilder())
        register(BDependencyBuilder())
        register(CDependencyBuilder())
        register(DDependencyBuilder())
    }
    
    func register(_ builder: any DependencyBuilder) {
        let key = key(for: builder.type)
        builders[key] = builder
    }
    
    // MARK: - Resolve
    
    func resolve<T>(for: T.Type) throws -> T {
        let key = key(for: T.self)
        
        guard let builder = builders[key] else {
            throw DependencyContainerError.builderNotRegistered
        }
        
        let instance = try builder.createInstance(with: self)
        
        guard let instance = instance as? T else {
            throw DependencyContainerError.wrongTypeBuilt
        }
        
        return instance
    }
    
    // MARK: - Key
    
    private func key(for type: Any.Type) -> String {
        "\(type)"
    }
}
