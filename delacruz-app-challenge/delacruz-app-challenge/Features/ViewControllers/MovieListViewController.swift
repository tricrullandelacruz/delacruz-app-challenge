//
//  ViewController.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/19/22.
//

import UIKit

class MovieListViewController: BaseViewController {
  
  @IBOutlet weak private var collectionView: UICollectionView!
  
  var viewModel: MovieListViewModelType!
  
  private let sectionInsets = UIEdgeInsets(
    top: 30.0,
    left: 10.0,
    bottom: 30.0,
    right: 10.0)
  private let itemsPerRow: CGFloat = 2
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViews()
    bindViewModel()
  }
  
}

private extension MovieListViewController {
  func bindViewModel() {
    viewModel = MovieListViewModel()
    viewModel.delegate = self
    viewModel.getMoviesListAPI(isNextPage: false)
  }
  
  func configureViews() {
    title = R.string.localizable.filmList()
    collectionView.register(R.nib.moviesListCollectionViewCell.self)
  }
}

extension MovieListViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return viewModel.sectionModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return viewModel.sectionModels[section].items.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let itemModel = viewModel.itemModel(at: indexPath) else { return UICollectionViewCell() }
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemModel.reuseIdentifier, for: indexPath)
    
    if let cell = cell as? MovieSectionItemModelBindableType {
      cell.bindItemModel(to: itemModel)
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard indexPath.row >= viewModel.sectionModels[indexPath.section].items.count - 1 else { return }
    viewModel.getMoviesListAPI(isNextPage: true)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let scene = Scene.movieDetails.viewController() as? MovieDetailsViewController,
          let movie = viewModel.movie(at: indexPath) else { return }
    
    collectionView.deselectItem(at: indexPath, animated: true)
    
    let viewModel = MovieDetailsViewModel(movie: movie)
    scene.viewModel = viewModel
    navigationController?.pushViewController(scene, animated: true)
  }
  
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow

    return CGSize(width: widthPerItem, height: widthPerItem * 1.5)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
  
}

extension MovieListViewController: MovieListViewModelDelegate {
  func movieListViewModelShowLoadingView(_ viewModel: MovieListViewModelType) {
    showLoadingView()
  }
  
  func movieListViewModelDismissLoadingView(_ viewModel: MovieListViewModelType) {
    dismissLoadingView()
  }
  
  func movieListViewModelNeedsReloadData(_ viewModel: MovieListViewModelType) {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
      self.dismissLoadingView()
    }
  }
}
