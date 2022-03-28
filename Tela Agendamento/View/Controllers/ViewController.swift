//
//  ViewController.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
  //MARK: - Properties
  var returnViewModel: ReturnViewModel!
  
  lazy var informationLabel = InformationView(returnModel: returnViewModel)
  lazy var informationView = ExpandableView(description: "O que apresentar no dia", icon: "ic_clipboard_check", isHidden: false, modelLabel: informationLabel)

  lazy var personalDataLabel = PersonalDataView(returnModel: returnViewModel)
  lazy var personalDataView = ExpandableView(description: "Dados pessoais", icon: "ic_clipboard_check", isHidden: true, modelLabel: personalDataLabel)

  lazy var localizationLabel = LocalizationView(returnModel: returnViewModel)
  lazy var localizationView = ExpandableView(description: "Local do serviço", icon: "ic_map_marker", isHidden: true, modelLabel: localizationLabel)
  
  let divider1 = Divider()
  let divider2 = Divider()
  let divider3 = Divider()
  let divider4 = Divider()
  
  lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
  
  //MARK: -
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.frame = self.view.bounds
    scrollView.contentSize = contentViewSize
    return scrollView
  }()
  
  lazy var contentView: UIView = {
    let contentView = UIView()
    contentView.frame.size = contentViewSize
    return contentView
  }()
  
  lazy var confirmationView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var closeButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(systemName: "xmark"), for: .normal)
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    return button
  }()
  
  lazy var confirmationImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "ic_check")
    return image
  }()
  
  lazy var confirmationLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 25)
    label.adjustsFontSizeToFitWidth = true
    label.text = "Agendamento realizado!"
    label.textColor = .black
    return label
  }()
  
  lazy var stateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 17)
    label.text = "Agendado"
    label.textColor = #colorLiteral(red: 0.1197191135, green: 0.2748016727, blue: 0.9609492909, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 15
    label.backgroundColor = #colorLiteral(red: 0.6614099766, green: 0.8933481863, blue: 1, alpha: 0.902978455)
    label.textAlignment = .center
    return label
  }()
  
  lazy var downloadImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "ic_save")
    return image
  }()
  
  lazy var shareImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "ic_share")
    return image
  }()
  
  lazy var dataView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var dataLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.text = returnViewModel.nomeVacina
    label.textColor = .black
    return label
  }()
  
  lazy var dateImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "ic_calendar")
    return image
  }()
  
  lazy var dateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 17)
    label.text = returnViewModel.dateFormatted
    label.textColor = .black
    return label
  }()
  
  lazy var hourImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "ic_clock")
    return image
  }()
  
  lazy var hourLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 17)
    label.text = returnViewModel.hourFormatted
    label.textColor = .black
    return label
  }()
  
  lazy var saveLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "salvar no calendário"
    label.textColor = #colorLiteral(red: 0.2694752789, green: 0.5691713718, blue: 0.9609492909, alpha: 1)
    return label
  }()
  
  lazy var returnButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = #colorLiteral(red: 0.114436962, green: 0.7574731846, blue: 0.3423004705, alpha: 1)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = 15
    button.setTitle("VOLTAR PARA O INÍCIO", for: .normal)
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    return button
  }()
  
  lazy var showButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "ic_seta_baixo"), for: .normal)
    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    return button
  }()
  
  //MARK: -- Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setupViews()
    
    applyConstraints()
  }
  
  //MARK: -- Methods
  private func setupViews() {
    view.addSubview(scrollView)
    
    scrollView.addSubview(contentView)
    
    contentView.addSubview(confirmationView)

    confirmationView.addSubview(closeButton)
    confirmationView.addSubview(confirmationImage)
    confirmationView.addSubview(confirmationLabel)
    confirmationView.addSubview(stateLabel)
    confirmationView.addSubview(downloadImage)
    confirmationView.addSubview(shareImage)
    
    contentView.addSubview(dataView)

    dataView.addSubview(dataLabel)
    dataView.addSubview(dateImage)
    dataView.addSubview(dateLabel)
    dataView.addSubview(hourImage)
    dataView.addSubview(hourLabel)
    dataView.addSubview(saveLabel)
    
    contentView.addSubview(divider1)
    
    contentView.addSubview(informationView)
    
    contentView.addSubview(divider2)
    
    contentView.addSubview(personalDataView)
    
    contentView.addSubview(divider3)
    
    contentView.addSubview(localizationView)
    
    contentView.addSubview(divider4)
    
    contentView.addSubview(returnButton)
  }
  
  private func applyConstraints() {
    
    NSLayoutConstraint.activate([
      confirmationView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      confirmationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      confirmationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      confirmationView.heightAnchor.constraint(equalToConstant: 180)
    ])
    NSLayoutConstraint.activate([
      closeButton.topAnchor.constraint(equalTo: confirmationView.topAnchor, constant: 10),
      closeButton.trailingAnchor.constraint(equalTo: confirmationView.trailingAnchor, constant: -20),
      closeButton.heightAnchor.constraint(equalToConstant: 50),
    ])
    NSLayoutConstraint.activate([
      confirmationImage.centerYAnchor.constraint(equalTo: confirmationView.centerYAnchor, constant: -10),
      confirmationImage.heightAnchor.constraint(equalToConstant: 60),
      confirmationImage.widthAnchor.constraint(equalToConstant: 60),
      confirmationImage.leadingAnchor.constraint(equalTo: confirmationView.leadingAnchor, constant: 20)
    ])
    NSLayoutConstraint.activate([
      confirmationLabel.centerYAnchor.constraint(equalTo: confirmationImage.centerYAnchor),
      confirmationLabel.leadingAnchor.constraint(equalTo: confirmationImage.trailingAnchor, constant: 10),
      confirmationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
    ])
    NSLayoutConstraint.activate([
      stateLabel.leadingAnchor.constraint(equalTo: confirmationView.leadingAnchor, constant: 20),
      stateLabel.topAnchor.constraint(equalTo: confirmationImage.bottomAnchor, constant: 30),
      stateLabel.widthAnchor.constraint(equalToConstant: 110),
      stateLabel.heightAnchor.constraint(equalToConstant: 30)
    ])
    NSLayoutConstraint.activate([
      shareImage.trailingAnchor.constraint(equalTo: confirmationView.trailingAnchor, constant: -20),
      shareImage.centerYAnchor.constraint(equalTo: stateLabel.centerYAnchor)
    ])
    NSLayoutConstraint.activate([
      downloadImage.trailingAnchor.constraint(equalTo: shareImage.leadingAnchor, constant: -20),
      downloadImage.centerYAnchor.constraint(equalTo: stateLabel.centerYAnchor)
    ])
    
    NSLayoutConstraint.activate([
      dataView.topAnchor.constraint(equalTo: confirmationView.bottomAnchor),
      dataView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      dataView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      dataView.heightAnchor.constraint(equalToConstant: 140)
    ])
    NSLayoutConstraint.activate([
      dataLabel.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 20),
      dataLabel.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 18)
    ])
    NSLayoutConstraint.activate([
      dateImage.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 15),
      dateImage.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 20)
    ])
    NSLayoutConstraint.activate([
      dateLabel.centerYAnchor.constraint(equalTo: dateImage.centerYAnchor),
      dateLabel.leadingAnchor.constraint(equalTo: dateImage.trailingAnchor, constant: 10)
    ])
    NSLayoutConstraint.activate([
      hourImage.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 15),
      hourImage.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 30)
    ])
    NSLayoutConstraint.activate([
      hourLabel.centerYAnchor.constraint(equalTo: hourImage.centerYAnchor),
      hourLabel.leadingAnchor.constraint(equalTo: hourImage.trailingAnchor, constant: 10)
    ])
    NSLayoutConstraint.activate([
      saveLabel.topAnchor.constraint(equalTo: hourImage.bottomAnchor, constant: 20),
      saveLabel.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 20)
    ])
    
    NSLayoutConstraint.activate([
      informationView.topAnchor.constraint(equalTo: divider1.bottomAnchor),
      informationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      informationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      informationView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70)
    ])
    
    NSLayoutConstraint.activate([
      personalDataView.topAnchor.constraint(equalTo: divider2.bottomAnchor),
      personalDataView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      personalDataView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      personalDataView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70)
    ])
    
    NSLayoutConstraint.activate([
      localizationView.topAnchor.constraint(equalTo: divider3.bottomAnchor),
      localizationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      localizationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      localizationView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70)
    ])
    
    NSLayoutConstraint.activate([
      returnButton.topAnchor.constraint(equalTo: divider4.bottomAnchor, constant: 20),
      returnButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      returnButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      returnButton.heightAnchor.constraint(equalToConstant: 60)
    ])
    
    NSLayoutConstraint.activate([
      divider1.topAnchor.constraint(equalTo: dataView.bottomAnchor),
      divider1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      divider1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
    ])
    
    
    NSLayoutConstraint.activate([
      divider2.topAnchor.constraint(equalTo: informationView.bottomAnchor),
      divider2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      divider2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
    ])
    
    NSLayoutConstraint.activate([
      divider3.topAnchor.constraint(equalTo: personalDataView.bottomAnchor),
      divider3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      divider3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
    ])
    
    NSLayoutConstraint.activate([
      divider4.topAnchor.constraint(equalTo: localizationView.bottomAnchor),
      divider4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      divider4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
    ])
  }
  
  @objc func buttonPressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

