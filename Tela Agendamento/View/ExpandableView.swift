//
//  expandableView.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 16/03/22.
//

import UIKit


fileprivate let buttonSize: CGFloat = 56

class ExpandableView: UIView {
  var iconName: String = ""
  var viewName: String = ""
  var contentView: UIView = UIView()

  lazy var iconImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 17)
    label.textColor = .black
    return label
  }()

  lazy var expandButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = #colorLiteral(red: 0.2211601864, green: 0.9034005367, blue: 0.6248785336, alpha: 0.09985462719)
    button.layer.cornerRadius = 15
    button.clipsToBounds = true
    if extensionView.isHidden {
      button.setImage(UIImage(named: "ic_seta_baixo"), for: .normal)
    } else {
      button.setImage(UIImage(named: "ic_seta_cima"), for: .normal)
    }
    button.addTarget(self, action: #selector(handleTogglePanelButtonTapped(_:)), for: .touchUpInside)
    return button
  }()

  lazy var headView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(iconImage)
    view.addSubview(titleLabel)
    view.addSubview(expandButton)
    return view
  }()

  lazy var personalDataLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var extensionView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isHidden = true
    return view
  }()

  lazy var containerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.addArrangedSubview(headView)
    stackView.addArrangedSubview(extensionView)
    return stackView
  }()

  override init(frame: CGRect){
    super.init(frame: CGRect())
  }

  init(description: String, icon: String, isHidden: Bool, modelLabel: UIView){
    super.init(frame: CGRect())
    self.extensionView.isHidden = isHidden
    self.contentView = modelLabel
    self.viewName = description
    self.iconName = icon
    self.translatesAutoresizingMaskIntoConstraints = false
    self.setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupView() {
    addSubview(containerStackView)
    extensionView.addSubview(contentView)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    iconImage.image = UIImage(named: iconName)
    titleLabel.text = viewName
    applyConstraints()
  }

  
  func applyConstraints() {
    let containerStackViewConstraints = [
      containerStackView.topAnchor.constraint(equalTo: topAnchor),
      containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
    ]

    let extensionViewConstraints = [
      extensionView.topAnchor.constraint(equalTo: headView.bottomAnchor),
      extensionView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
      extensionView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor),
      extensionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
    ]

    let headViewConstraints = [
      headView.topAnchor.constraint(equalTo: containerStackView.topAnchor),
      headView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
      headView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor),
      headView.heightAnchor.constraint(equalToConstant: 70)
    ]

    let iconImageConstraints = [
      iconImage.centerYAnchor.constraint(equalTo: headView.centerYAnchor),
      iconImage.leadingAnchor.constraint(equalTo: headView.leadingAnchor, constant: 20),
      iconImage.heightAnchor.constraint(equalToConstant: 30),
      iconImage.widthAnchor.constraint(equalToConstant: 20)
    ]

    let titleLabelConstraints = [
      titleLabel.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
      titleLabel.heightAnchor.constraint(equalToConstant: 30),
    ]

    let expandButtonConstraints = [
      expandButton.centerYAnchor.constraint(equalTo: headView.centerYAnchor),
      expandButton.trailingAnchor.constraint(equalTo: headView.trailingAnchor, constant: -20),
      expandButton.heightAnchor.constraint(equalToConstant: 30),
      expandButton.widthAnchor.constraint(equalToConstant: 30)
    ]

    let contentViewConstraints = [
      contentView.topAnchor.constraint(equalTo: extensionView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: extensionView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: extensionView.trailingAnchor)
    ]

    bottomAnchor.constraint(equalTo: containerStackView.bottomAnchor).isActive = true

    NSLayoutConstraint.activate(titleLabelConstraints)
    NSLayoutConstraint.activate(iconImageConstraints)
    NSLayoutConstraint.activate(expandButtonConstraints)
    NSLayoutConstraint.activate(headViewConstraints)
    NSLayoutConstraint.activate(containerStackViewConstraints)
    NSLayoutConstraint.activate(extensionViewConstraints)
    NSLayoutConstraint.activate(contentViewConstraints)
  }
}

extension ExpandableView {
  @objc private func handleTogglePanelButtonTapped(_ sender: UIButton) {
    let willExpand = extensionView.isHidden

    UIView.animate(
      withDuration: 0.1, delay: 0, options: .curveEaseIn,
      animations: {
        self.extensionView.isHidden = !self.extensionView.isHidden
        if willExpand {
          self.expandButton.setImage(UIImage(named: "ic_seta_cima"), for: .normal)
        }
    }, completion: { _ in
      if !willExpand {
        self.expandButton.setImage(UIImage(named: "ic_seta_baixo"), for: .normal)
      }
    })
  }
}
