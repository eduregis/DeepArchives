//
//  InvestigatorsCollectionViewController.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 27/11/20.
//

import UIKit

private let reuseIdentifier = "Cell"

class InvestigatorsCollectionViewController: UIViewController {
    
    var myCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.title = "Investigators"
        
        let view = UIView()
        view.backgroundColor = .backgroundBlack
        setNavBarStyle()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        layout.itemSize = CGSize(width: 160, height: 160)
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        myCollectionView?.register(InvestigatorCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        myCollectionView?.backgroundColor = .backgroundBlack
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        view.addSubview(myCollectionView ?? UICollectionView())
        
        self.view = view
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setNavBarStyle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.addGradient(1, .darkSeaGreen)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.ivory]
    }
}

extension InvestigatorsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InvestigatorCollectionViewCell
        if indexPath.row == 0 {
            myCell.set(name: "Cleiton", ocupation: "DJ", dashed: true)
        } else {
            myCell.set(name: "Cleiton Rasta", ocupation: "DJ", dashed: false)
        }
        return myCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension InvestigatorsCollectionViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let editModal = NewInvestigatorModal()
            present(editModal, animated: true, completion: nil)
        } else {
            print("User tapped on item \(indexPath.row) in \(indexPath.section)")
            let dest = TabBarViewController()
            self.navigationController?.pushViewController(dest, animated: true)
        }
    }
}
