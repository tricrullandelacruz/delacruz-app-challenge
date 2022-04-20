//
//  ViewController.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/19/22.
//

import UIKit

class MovieListViewController: UIViewController {
  
  @IBOutlet weak private var collectionView: UICollectionView!
  
  var viewModel: MovieListViewModelType!
  
  // MARK: - Properties
  private let reuseIdentifier = "MoviesListCollectionViewCell"
  private let sectionInsets = UIEdgeInsets(
    top: 50.0,
    left: 20.0,
    bottom: 50.0,
    right: 20.0)
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
    viewModel.getMoviesListAPI()
  }
  
  func configureViews() {
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
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    print(indexPath)
  }
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow
    
    return CGSize(width: widthPerItem, height: widthPerItem)
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 8
  }
}

extension MovieListViewController: MovieListViewModelDelegate {
  
  func movieListViewModelNeedsReloadData(_ viewModel: MovieListViewModelType) {
    collectionView.reloadData()
  }
  
}
