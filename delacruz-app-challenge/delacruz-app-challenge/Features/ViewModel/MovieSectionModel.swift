//
//  MovieSectionModel.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation
import UIKit

struct MovieSectionModel {
  var items: [MovieSectionItemModel]
}

enum MovieSectionItemModel {
  case list(viewModel: MovieListCollectionCellViewModelType)
  case details(viewModel: MovieDetailsTableCellViewModelType)
  case detailsInfo(viewModel: MovieDetailsInfoTableCellViewModelType)
}

extension MovieSectionItemModel {

  var reuseIdentifier: String {
    switch self {
    case .list:
      return R.nib.moviesListCollectionViewCell.identifier
    case .details:
      return R.nib.movieDetailsTableViewCell.identifier
    case .detailsInfo:
      return R.nib.movieDetailsInfoTableViewCell.identifier

    }

  }

  func viewModel<T>() -> T {
    switch self {
    case let .list(viewModel):
      return viewModel as! T
    case let .details(viewModel):
      return viewModel as! T
    case let .detailsInfo(viewModel):
      return viewModel as! T
    }
  }
  
}

protocol MovieSectionItemModelBindableType {
  func bindItemModel(to itemModel: MovieSectionItemModel)
}

extension MovieSectionItemModelBindableType where Self: UITableViewCell & BindableType {

  func bindItemModel(to itemModel: MovieSectionItemModel) {
    guard let viewModel: ViewModelType = itemModel.viewModel() else {
      fatalError("View model mismatched!")
    }
    var cell = self
    cell.bindViewModel(to: viewModel)
  }

}


extension MovieSectionItemModelBindableType where Self: UICollectionViewCell & BindableType {

  func bindItemModel(to itemModel: MovieSectionItemModel) {
    guard let viewModel: ViewModelType = itemModel.viewModel() else {
      fatalError("View model mismatched!")
    }
    var cell = self
    cell.bindViewModel(to: viewModel)
  }

}

