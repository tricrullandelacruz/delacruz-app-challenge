//
//  ServicesAssembly.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Swinject
import SwinjectStoryboard

struct ServicesAssembly: Assembly {
  
  func assemble(container: Container) {
    
    // WebServices
    container.register(MoviesWebServiceType.self) { _ in
      MoviesWebService()
    }
    
  }
  
}
