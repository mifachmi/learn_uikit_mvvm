//
//  ViewController.swift
//  BelajarUIKit
//
//  Created by Fachmi Dimas Ardhana on 27/11/24.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private var peopleVm = PeopleViewModel()
    
    private lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130) // main will be deprecated
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        cv.dataSource = self // setup data source
        //cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - viewDidLoad")
        setupView()
        peopleVm.delegate = self
        peopleVm.getUsers()
    }
    
    
}

extension PeopleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        peopleVm.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as! PersonCollectionViewCell
        return cell
    }
    
}

extension PeopleViewController: PeopleViewModelDelegate {
    func didFinish() {
        cv.reloadData()
    }
    
    func didFail(with error: any Error) {
        print(error.localizedDescription)
    }
    
}

private extension PeopleViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(cv)
        
        // configure constraint
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func sayHello() {
        print("I'm subscribing")
    }
    
}
