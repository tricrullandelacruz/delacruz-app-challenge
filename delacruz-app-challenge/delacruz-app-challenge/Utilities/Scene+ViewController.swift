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
    case .movieDetails:
      return movieDetailsController()
    }
  }
}

private extension Scene {
  
  func movieListController() -> UIViewController {
    let controller = resolve(MovieListViewController.self)
    return controller
  }
  
  func movieDetailsController() -> UIViewController {
    let controller = resolve(MovieDetailsViewController.self)
    return controller
  }
  
}
