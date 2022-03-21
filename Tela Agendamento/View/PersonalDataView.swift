//
//  PersonalLabel.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 17/03/22.
//

import UIKit

class PersonalDataView: UIView {
  var name: String = ""
  var cpf: String = ""
  var birthday: String = ""
  var cell: String = ""

  lazy var nameField: UILabel = {
    let label = UILabel()
    label.text = "Nome: "
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var cpfField: UILabel = {
    let label = UILabel()
    label.text = "CPF ou Cartão SUS: "
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var birthdayField: UILabel = {
    let label = UILabel()
    label.text = "Data de nascimento: "
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var cellField: UILabel = {
    let label = UILabel()
    label.text = "Celular: "
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var nameValue: UILabel = {
    let label = UILabel()
    label.text = self.name
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var cpfValue: UILabel = {
    let label = UILabel()
    label.text = self.cpf
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var birthdayValue: UILabel = {
    let label = UILabel()
    label.text = self.birthday
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

  override init(frame: CGRect){
    super.init(frame: CGRect())
  }

  init(returnModel: ReturnViewModel) {
    super.init(frame: CGRect())
    self.name = returnModel.name
    self.cpf = returnModel.cpf
    self.birthday = returnModel.birthdayFormatted
    self.cell = returnModel.cell
    self.translatesAutoresizingMaskIntoConstraints = false
    self.setupView()
  }

  func setupView() {
    addSubview(nameField)
    addSubview(nameValue)
    addSubview(cpfField)
    addSubview(cpfValue)
    addSubview(birthdayField)
    addSubview(birthdayValue)
    addSubview(cellField)
    addSubview(cellValue)
    applyConstraints()

  }

  func applyConstraints() {
//    
    let nameFieldConstraints = [
      nameField.topAnchor.constraint(equalTo: topAnchor),
      nameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      nameField.heightAnchor.constraint(equalToConstant: 20)
    ]

    let nameValueConstraints = [
      nameValue.topAnchor.constraint(equalTo: topAnchor),
      nameValue.leadingAnchor.constraint(equalTo: nameField.trailingAnchor),
      nameValue.heightAnchor.constraint(equalToConstant: 20)
    ]

    let cpfFieldConstraints = [
      cpfField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
      cpfField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      cpfField.heightAnchor.constraint(equalToConstant: 20)
    ]

    let cpfValueConstraints = [
      cpfValue.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
      cpfValue.leadingAnchor.constraint(equalTo: cpfField.trailingAnchor),
      cpfValue.heightAnchor.constraint(equalToConstant: 20)
    ]

    let birthdayFieldConstraints = [
      birthdayField.topAnchor.constraint(equalTo: cpfField.bottomAnchor, constant: 10),
      birthdayField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      birthdayField.heightAnchor.constraint(equalToConstant: 20)
    ]

    let birthdayValueConstraints = [
      birthdayValue.topAnchor.constraint(equalTo: cpfField.bottomAnchor, constant: 10),
      birthdayValue.leadingAnchor.constraint(equalTo: birthdayField.trailingAnchor),
      birthdayValue.heightAnchor.constraint(equalToConstant: 20)
    ]

    let cellFieldConstraints = [
      cellField.topAnchor.constraint(equalTo: birthdayField.bottomAnchor, constant: 10),
      cellField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      cellField.heightAnchor.constraint(equalToConstant: 20)
    ]

    let cellValueConstraints = [
      cellValue.topAnchor.constraint(equalTo: birthdayField.bottomAnchor, constant: 10),
      cellValue.leadingAnchor.constraint(equalTo: cellField.trailingAnchor),
      cellValue.heightAnchor.constraint(equalToConstant: 20)
    ]

    bottomAnchor.constraint(equalTo: cellValue.bottomAnchor).isActive = true

    NSLayoutConstraint.activate(nameFieldConstraints)
    NSLayoutConstraint.activate(nameValueConstraints)
    NSLayoutConstraint.activate(cpfFieldConstraints)
    NSLayoutConstraint.activate(cpfValueConstraints)
    NSLayoutConstraint.activate(birthdayFieldConstraints)
    NSLayoutConstraint.activate(birthdayValueConstraints)
    NSLayoutConstraint.activate(cellFieldConstraints)
    NSLayoutConstraint.activate(cellValueConstraints)



  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
