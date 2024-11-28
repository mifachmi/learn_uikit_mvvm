//
//  ViewController.swift
//  BelajarUIKit
//
//  Created by Fachmi Dimas Ardhana on 27/11/24.
//

import UIKit
import SafariServices

class PeopleViewController: UIViewController {
    
    private var peopleVm = PeopleViewModel()
    
    private lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130) // main will be deprecated
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        cv.dataSource = self // setup data source
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let itemCell = peopleVm.users[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as! PersonCollectionViewCell
        cell.delegate = self
        cell.itemPeople = itemCell
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

extension PeopleViewController: PersonCollectionViewCellDelegate {
    func onBtnSubscribeTap() {
        let url = URL(string: "http://mifachmi-portfolio.super.site")!
        let safariVc = SFSafariViewController(url: url)
        safariVc.modalPresentationStyle = .formSheet
        self.present(safariVc, animated: true)
    }
    
}

private extension PeopleViewController {
    func setupView() {
        // setup navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "People"
        
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
}
