//
//  Scene+UIViewController.swift
//  ShareInvestor
//
//  Created by Tric Rullan on 9/18/20.
//  Copyright © 2020 Tric Rullan. All rights reserved.
//

import UIKit

extension Scene {
  
  func viewController() -> UIViewController {
    switch self {
    case .movieList:
      return movieListController()
    }
  }
}

private extension Scene {
  
  func movieListController() -> UIViewController {
    let controller = resolve(MovieListViewController.self)
    return controller
  }
}
