//
//  PersonCollectionViewCell.swift
//  BelajarUIKit
//
//  Created by Fachmi Dimas Ardhana on 28/11/24.
//

import UIKit

protocol PersonCollectionViewCellDelegate: AnyObject {
    func onBtnSubscribeTap()
}

class PersonCollectionViewCell: UICollectionViewCell {
    
    private var personView: PersonView?
    
    weak var delegate: PersonCollectionViewCellDelegate?
    
    var itemPeople: PersonResponse? {
        // didSet make sure that the data is updated when the itemPeople is set
        didSet {
            guard let firstName = itemPeople?.firstName,
                  let lastName = itemPeople?.lastName,
                  let email = itemPeople?.email,
                  let avatar = itemPeople?.avatar else { return }
            
            personView?.setText(name: "\(firstName) \(lastName)", email: email)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PersonCollectionViewCell {
    func setupView() {
        guard personView == nil else { return }
        personView = PersonView(onBtnSubscribeTap: { [weak self] in
            self?.delegate?.onBtnSubscribeTap()
        })
        contentView.addSubview(personView!)
        
        // configure constraint
        NSLayoutConstraint.activate([
            personView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            personView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            personView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            personView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
}
