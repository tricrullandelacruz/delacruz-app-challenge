//
//  SharedAssembler.swift
//  ShareInvestor
//
//  Created by Tric Rullan on 9/18/20.
//  Copyright © 2020 Tric Rullan. All rights reserved.
//

import Swinject
import SwinjectStoryboard

let SharedAssembler = Assembler([
  MoviesAssembly(),
  ServicesAssembly()
])

func resolve<T>(_ type: T.Type, name: String? = nil) -> T {
  if let defaultScopeObject = SwinjectStoryboard.defaultContainer.resolve(T.self) {
    return defaultScopeObject
  } else if let featureScopeObject = SharedAssembler.resolver.resolve(T.self, name: name) {
    return featureScopeObject
  } else {
    fatalError("Cannot create \(T.self)")
  }
}

func resolve<T, Arg1>(_ type: T.Type, name: String? = nil, argument arg1: Arg1) -> T {
  if let defaultScopeObject = SwinjectStoryboard.defaultContainer.resolve(T.self) {
    return defaultScopeObject
  } else if let featureScopeObject = SharedAssembler.resolver.resolve(T.self, name: name, argument: arg1) {
    return featureScopeObject
  } else {
    fatalError("Cannot create \(T.self)")
  }
}


func resolve<T, Arg1, Arg2>(_ type: T.Type, arguments arg1: Arg1, _ arg2: Arg2) -> T {
  if let defaultScopeObject = SwinjectStoryboard.defaultContainer.resolve(T.self) {
    return defaultScopeObject
  } else if let featureScopeObject = SharedAssembler.resolver.resolve(T.self, arguments: arg1, arg2) {
    return featureScopeObject
  } else {
    fatalError("Cannot create \(T.self)")
  }
}

func resolve<T, Arg1, Arg2, Arg3>(_ type: T.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> T {
  if let defaultScopeObject = SwinjectStoryboard.defaultContainer.resolve(T.self) {
    return defaultScopeObject
  } else if let featureScopeObject = SharedAssembler.resolver.resolve(T.self, arguments: arg1, arg2, arg3) {
    return featureScopeObject
  } else {
    fatalError("Cannot create \(T.self)")
  }
}

func resolve<T, Arg1, Arg2, Arg3, Arg4>(_ type: T.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) -> T {
  if let defaultScopeObject = SwinjectStoryboard.defaultContainer.resolve(T.self) {
    return defaultScopeObject
  } else if let featureScopeObject = SharedAssembler.resolver.resolve(T.self, arguments: arg1, arg2, arg3, arg4) {
    return featureScopeObject
  } else {
    fatalError("Cannot create \(T.self)")
  }
}

// MARK: - SwinjectStoryboard

extension SwinjectStoryboard {
  
  public static func setup() {
    Container.loggingFunction = nil
  }
  
}
