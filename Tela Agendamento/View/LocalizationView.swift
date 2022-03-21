//
//  LocalizationLabel.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 21/03/22.
//

import Foundation
import UIKit


class LocalizationView: UIView {
  var local: String = ""
  var cell: String = ""
  var cep: String = ""
  var address: String = ""

  lazy var localField: UILabel = {
    let label = UILabel()
    label.text = "Local: "
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var cellField: UILabel = {
    let label = UILabel()
    label.text = "Telefone: "
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var cepField: UILabel = {
    let label = UILabel()
    label.text = "CEP: "
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var addressField: UILabel = {
    let label = UILabel()
    label.text = "Endereço: "
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var localValue: UILabel = {
    let label = UILabel()
    label.text = self.local
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var cellValue: UILabel = {
    let label = UILabel()
    label.text = self.cell
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var cepValue: UILabel = {
    let label = UILabel()
    label.text = self.cep
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var addressValue: UILabel = {
    let label = UILabel()
    label.text = self.address
    label.textColor = .black
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(frame: CGRect){
    super.init(frame: CGRect())
  }

  init(returnModel: ReturnViewModel) {
    super.init(frame: CGRect())
    self.local = returnModel.local
    self.cep = returnModel.localCep
    self.address = returnModel.endereco
    self.cell = returnModel.localCell
    self.translatesAutoresizingMaskIntoConstraints = false
    self.setupView()
  }

  func setupView() {
    addSubview(localField)
    addSubview(localValue)
    addSubview(cellField)
    addSubview(cellValue)
    addSubview(cepField)
    addSubview(cepValue)
    addSubview(addressField)
    addSubview(addressValue)
    applyConstraints()

  }

  func applyConstraints() {
//
    let localFieldConstraints = [
      localField.topAnchor.constraint(equalTo: topAnchor),
      localField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      localField.heightAnchor.constraint(equalToConstant: 20)
    ]

    let localValueConstraints = [
      localValue.topAnchor.constraint(equalTo: topAnchor),
      localValue.leadingAnchor.constraint(equalTo: localField.trailingAnchor),
      localValue.heightAnchor.constraint(equalToConstant: 20)
    ]

    let cellFieldConstraints = [
      cellField.topAnchor.constraint(equalTo: localField.bottomAnchor, constant: 10),
      cellField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      cellField.heightAnchor.constraint(equalToConstant: 20)
    ]

    let cellValueConstraints = [
      cellValue.topAnchor.constraint(equalTo: localField.bottomAnchor, constant: 10),
      cellValue.leadingAnchor.constraint(equalTo: cellField.trailingAnchor),
      cellValue.heightAnchor.constraint(equalToConstant: 20)
    ]

    let cepFieldConstraints = [
      cepField.topAnchor.constraint(equalTo: cellField.bottomAnchor, constant: 10),
      cepField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      cepField.heightAnchor.constraint(equalToConstant: 20)
    ]

    let cepValueConstraints = [
      cepValue.topAnchor.constraint(equalTo: cellField.bottomAnchor, constant: 10),
      cepValue.leadingAnchor.constraint(equalTo: cepField.trailingAnchor),
      cepValue.heightAnchor.constraint(equalToConstant: 20)
    ]

    let addressFieldConstraints = [
      addressField.topAnchor.constraint(equalTo: cepField.bottomAnchor, constant: 10),
      addressField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      addressField.heightAnchor.constraint(equalToConstant: 20)
    ]

    let addressValueConstraints = [
      addressValue.topAnchor.constraint(equalTo: cepField.bottomAnchor, constant: 10),
      addressValue.leadingAnchor.constraint(equalTo: addressField.trailingAnchor),
      addressValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    ]

    bottomAnchor.constraint(equalTo: addressValue.bottomAnchor).isActive = true

    NSLayoutConstraint.activate(localFieldConstraints)
    NSLayoutConstraint.activate(localValueConstraints)
    NSLayoutConstraint.activate(cellFieldConstraints)
    NSLayoutConstraint.activate(cellValueConstraints)
    NSLayoutConstraint.activate(cepFieldConstraints)
    NSLayoutConstraint.activate(cepValueConstraints)
    NSLayoutConstraint.activate(addressFieldConstraints)
    NSLayoutConstraint.activate(addressValueConstraints)



  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
