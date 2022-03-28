//
//  Divider.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 17/03/22.
//

import UIKit

class Divider: UIView {
  //MARK: - Properties
  lazy var lineView: UIView = {
    let view = UIView()
    view.backgroundColor = .gray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  //MARK: - Override Methods
  override init(frame: CGRect){
    super.init(frame: CGRect())
    addSubview(lineView)
    applyConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Methods
  func applyConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
    lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
  }
}
