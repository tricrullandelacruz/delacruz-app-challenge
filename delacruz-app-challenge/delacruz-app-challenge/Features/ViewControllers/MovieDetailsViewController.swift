//
//  MovieDetailsViewController.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import UIKit

class MovieDetailsViewController: BaseViewController {
  
  @IBOutlet weak private var tableView: UITableView!
  
  var viewModel: MovieDetailsViewModelType!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    showLoadingView()
    configureViews()
    bindViewModel()
  }
}

private extension MovieDetailsViewController {
  func configureViews() {
   
    registerViews()
  }
  
  func registerViews() {
    tableView.register(R.nib.movieDetailsTableViewCell)
    tableView.register(R.nib.movieDetailsInfoTableViewCell)
  }
  
  func bindViewModel() {
    viewModel.delegate = self
    title = viewModel.title
  }
}

// MARK: - UITableViewDataSource

extension MovieDetailsViewController: UITableViewDataSource {
  func  numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.sectionModels.count
  }
  
  func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.sectionModels[section].items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let itemModel = viewModel.itemModel(at: indexPath) else { return UITableViewCell() }
    let cell = tableView.dequeueReusableCell(withIdentifier: itemModel.reuseIdentifier, for: indexPath)
    if let cell = cell as? MovieSectionItemModelBindableType {
      cell.bindItemModel(to: itemModel)
    }
    return cell
  }
}

extension MovieDetailsViewController: MovieDetailsViewModelDelegate {
  func movieDetailsViewModelNeedsReloadData(_ viewModel: MovieDetailsViewModelType) {
    DispatchQueue.main.async {
      self.tableView.reloadData()
      self.dismissLoadingView()
    }
  }
  
  func movieDetailsViewModelShowLoadingView(_ viewModel: MovieDetailsViewModelType) {
    showLoadingView()
  }
  
  func movieDetailsViewModelDismissLoadingView(_ viewModel: MovieDetailsViewModelType) {
    dismissLoadingView()
  }
}
