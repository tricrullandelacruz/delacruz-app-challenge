//
//  MoviesListAssembly.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Swinject
import SwinjectStoryboard
import Alamofire

struct MoviesAssembly: Assembly {
  
  func assemble(container: Container) {
    
    container.register(MovieListViewController.self) {  _ in
      let sb = SwinjectStoryboard.create(name: R.storyboard.main.name,
                                         bundle: nil,
                                         container: container)
      let vc = sb.instantiateViewController(withIdentifier: R.storyboard.main.movieListViewController.identifier)
      return vc as! MovieListViewController
    }
    
    container.register(MovieDetailsViewController.self) {  _ in
      let sb = SwinjectStoryboard.create(name: R.storyboard.main.name,
                                         bundle: nil,
                                         container: container)
      let vc = sb.instantiateViewController(withIdentifier: R.storyboard.main.movieDetailsViewController.identifier)
      return vc as! MovieDetailsViewController
    }

    
  }
  
}
