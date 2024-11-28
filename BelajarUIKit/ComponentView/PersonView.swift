//
//  PersonView.swift
//  BelajarUIKit
//
//  Created by Fachmi Dimas Ardhana on 27/11/24.
//

import UIKit

class PersonView: UIView {

    private lazy var subscribeBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased(with: .current)
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false // to make auto layout works
        btn.addTarget(self, action: #selector(subscribeBtnDidTap), for: .touchUpInside) // to handle button tap
        return btn
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fachmi Dimas Ardhana"
        label.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title2).pointSize, weight: .bold)
        return label
    }()
    
    private func nameLabelFunc(name: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = name
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "fachmi2007@gmail.com"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var personStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private var onBtnSubscribeTap: () -> ()
    
    init(onBtnSubscribeTap: @escaping () -> ()) {
        self.onBtnSubscribeTap = onBtnSubscribeTap
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(name: String, email: String) {
        nameLabel.text = name
        emailLabel.text = email
    }
    
}

private extension PersonView {
    
    func setup() {
        // setup container view
        self.layer.cornerRadius = 8
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        
        self.addSubview(personStackView)
        
        // add view to personStackView
        //personStackView.addArrangedSubview(nameLabel)
        personStackView.addArrangedSubview(nameLabel)
        personStackView.addArrangedSubview(emailLabel)
        personStackView.addArrangedSubview(subscribeBtn)
        
        // configure constraint
        NSLayoutConstraint.activate([
            personStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            personStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            personStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
        ])
    }
    
    @objc func subscribeBtnDidTap() {
        onBtnSubscribeTap()
    }
}
