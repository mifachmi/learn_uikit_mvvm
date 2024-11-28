//
//  ViewController.swift
//  BelajarUIKit
//
//  Created by Fachmi Dimas Ardhana on 27/11/24.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private lazy var personView: PersonView = {
        let view = PersonView { [weak self] in
            self?.sayHello()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - viewDidLoad")
        setupView()
    }
    
    
}

private extension PeopleViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(personView)
        
        // configure constraint
        NSLayoutConstraint.activate([
            personView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            personView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    func sayHello() {
        print("I'm subscribing")
    }
    
}
