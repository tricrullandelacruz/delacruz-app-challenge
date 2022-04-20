//
//  BindableType.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import UIKit

protocol BindableType {

  associatedtype ViewModelType

  var viewModel: ViewModelType! { get set }

  func bindViewModel()

}

extension BindableType where Self: UIViewController {

  mutating func bindViewModel(to model: Self.ViewModelType) {
    viewModel = model
    loadViewIfNeeded()
    bindViewModel()
  }

}

extension BindableType where Self: UITableViewCell {

  mutating func bindViewModel(to model: Self.ViewModelType) {
    viewModel = model
    bindViewModel()
  }

}

extension BindableType where Self: UICollectionViewCell {

  mutating func bindViewModel(to model: Self.ViewModelType) {
    viewModel = model
    bindViewModel()
  }

}
