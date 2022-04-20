//
//  BaseViewController.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func showLoadingView(maskType: SVProgressHUDMaskType = .clear) {
    DispatchQueue.main.async {
      SVProgressHUD.setBackgroundColor(.white)
      SVProgressHUD.setRingThickness(7)
      SVProgressHUD.setDefaultMaskType(maskType)
      SVProgressHUD.setForegroundColor(.gray)
      SVProgressHUD.show()
    }
  }
  
  func dismissLoadingView() {
    DispatchQueue.main.async {
      SVProgressHUD.dismiss(withDelay: 0.5)
    }
  }
  
}
