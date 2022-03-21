//
//  InformationView.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 21/03/22.
//

import Foundation
import UIKit

class InformationView: UIView {
  var recomendacao: String = ""

  lazy var textLabel: UILabel = {
    let label = UILabel()
    label.attributedText = self.recomendacao.htmlToAttributedString
    label.font = UIFont.systemFont(ofSize: 18)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: CGRect())
  }

  init(returnModel: ReturnViewModel){
    super.init(frame: CGRect())
    self.recomendacao = returnModel.recomendacao
    setupView()
  }

  func setupView() {
    addSubview(textLabel)
    applyConstraints()
  }

  func applyConstraints() {
    let textLabelConstraints = [
      textLabel.topAnchor.constraint(equalTo: topAnchor),
      textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ]

    NSLayoutConstraint.activate(textLabelConstraints)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
