//
//  UIImageView+.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import UIKit

extension UIImageView {
  
  func load(url: URL) {
    DispatchQueue.global().async { [weak self] in
      guard let data = try? Data(contentsOf: url),
      let image = UIImage(data: data) else { return }
      
      DispatchQueue.main.async {
        self?.image = image
      }
      
    }
  }
}
