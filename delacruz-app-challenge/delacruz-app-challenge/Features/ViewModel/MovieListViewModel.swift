//
//  MoviesListViewModel.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

protocol MovieListViewModelDelegate {
  func movieListViewModelNeedsReloadData(_ viewModel: MovieListViewModelType)
}

protocol MovieListViewModelType {
  var sectionModels: [MovieSectionModel] { get }
  var delegate: MovieListViewModelDelegate? { get set }
  
  func itemModel(at indexPath: IndexPath) -> MovieSectionItemModel?
  func getMoviesListAPI()
  
}

class MovieListViewModel: MovieListViewModelType {
  
  init(moviesWebServiceType: MoviesWebServiceType = resolve(MoviesWebServiceType.self)) {
    self.moviesWebServiceType = moviesWebServiceType
  }
  
  func itemModel(at indexPath: IndexPath) -> MovieSectionItemModel? {
    return sectionModels[indexPath.section].items[indexPath.row]
  }
  
  func getMoviesListAPI() {
    let parameter = MovieListParameter(page: 1)
    moviesWebServiceType.list(parameter: parameter, success: { [weak self] response in
      guard let self = self,
            let response = response,
            let search = response.search else { return }
      
      self.movieList = search
      self.sectionModels = self.updateSectionModels()
    }, failure: { error in
      
    })
  }
  
  var moviesWebServiceType: MoviesWebServiceType
  var sectionModels = [MovieSectionModel]() {
    didSet {
      delegate?.movieListViewModelNeedsReloadData(self)
    }
  }
  var delegate: MovieListViewModelDelegate?
  
  private var movieList = [SearchResponse]()
}

private extension MovieListViewModel {
  func updateSectionModels() -> [MovieSectionModel] {
    
    var sectionModels = [MovieSectionModel]()
    var items = [MovieSectionItemModel]()
    
    for movie in movieList {
      let model = MovieListCollectionCellViewModel(movie: movie)
      items.append(.list(viewModel: model))
    }
    
    sectionModels.append(MovieSectionModel(items: items))
    
    print(sectionModels)
    return sectionModels
  }
  
}
