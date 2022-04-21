//
//  UIView+.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/21/22.
//

import SnapKit

extension UIView {

  func roundCorners(radius: CGFloat? = nil, borderColor: UIColor? = nil, borderWidth: CGFloat = 0.0) {
    clipsToBounds = true
    layer.cornerRadius = radius ?? (min(bounds.height, bounds.width) * 0.5)
    layer.borderColor = borderColor?.cgColor
    layer.borderWidth = borderWidth
  }
  
  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
    clipsToBounds = true
    layer.cornerRadius = radius
    layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
  }

  func addShadow(color: UIColor = .black,
                 offset: CGSize = CGSize(width: 0.0, height: 2.0),
                 radius: CGFloat = 4.0,
                 opacity: Float = 0.2) {
    layer.shadowColor = color.cgColor
    layer.shadowOffset = offset
    layer.shadowRadius = radius
    layer.shadowOpacity = opacity
    layer.masksToBounds = false
  }

  @discardableResult
  func addBorder(edges: UIRectEdge,
                 color: UIColor,
                 thickness: CGFloat = 1.0,
                 shouldScaleThickness: Bool = false,
                 insets: UIEdgeInsets = .zero) -> [UIView] {

    let thickness = shouldScaleThickness ? (thickness / UIScreen.main.scale) : thickness
    var borders = [UIView]()

    func border() -> UIView {
      let border = UIView(frame: .zero)
      border.backgroundColor = color
      return border
    }

    if edges.contains(.top) || edges.contains(.all) {
      let top = border()
      addSubview(top)

      top.snp.makeConstraints { maker in
        maker.height.equalTo(thickness)
        maker.top.equalToSuperview().offset(insets.top)
        maker.left.equalToSuperview().offset(insets.left)
        maker.right.equalToSuperview().offset(insets.right)
      }

      borders.append(top)
    }

    if edges.contains(.left) || edges.contains(.all) {
      let left = border()
      addSubview(left)

      left.snp.makeConstraints { maker in
        maker.width.equalTo(thickness)
        maker.top.equalToSuperview().offset(insets.top)
        maker.bottom.equalToSuperview().offset(insets.bottom)
        maker.left.equalToSuperview().offset(insets.left)
      }

      borders.append(left)
    }

    if edges.contains(.right) || edges.contains(.all) {
      let right = border()
      addSubview(right)

      right.snp.makeConstraints { maker in
        maker.width.equalTo(thickness)
        maker.top.equalToSuperview().offset(insets.top)
        maker.bottom.equalToSuperview().offset(insets.bottom)
        maker.right.equalToSuperview().offset(insets.right)
      }

      borders.append(right)
    }

    if edges.contains(.bottom) || edges.contains(.all) {
      let bottom = border()
      addSubview(bottom)

      bottom.snp.makeConstraints { maker in
        maker.height.equalTo(thickness)
        maker.bottom.equalToSuperview().offset(insets.bottom)
        maker.left.equalToSuperview().offset(insets.left)
        maker.right.equalToSuperview().offset(insets.right)
      }

      borders.append(bottom)
    }

    return borders
  }

  var allSuperviews: [UIView] {
    var superviews = [UIView]()
    func superview(of view: UIView, isSelf: Bool = false) {
      guard let view = view.superview else { return }
      !isSelf ? superviews.append(view) : ()
      superview(of: view)
    }
    superview(of: self, isSelf: true)
    return superviews
  }
}
