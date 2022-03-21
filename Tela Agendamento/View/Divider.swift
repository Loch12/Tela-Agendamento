//
//  Divider.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 17/03/22.
//

import UIKit

class Divider: UIView {

  override init(frame: CGRect){
    super.init(frame: CGRect())
    backgroundColor = .black
    applyConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func applyConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: 0.5).isActive = true

  }
}
