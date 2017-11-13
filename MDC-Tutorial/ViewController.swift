//
//  ViewController.swift
//  MDC-Tutorial
//
//  Created by Cory Reed on 11/13/17.
//  Copyright © 2017 Cory Reed. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialAppBar
import MaterialComponents.MaterialCollections

class ViewController: MDCCollectionViewController {
    let appBar = MDCAppBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        styler.cellStyle = .card

        addChildViewController(appBar.headerViewController)
        appBar.headerViewController.headerView.backgroundColor = UIColor(red: 1.0, green: 0.76, blue: 0.03, alpha: 1.0)
        appBar.headerViewController.headerView.trackingScrollView = self.collectionView
        appBar.navigationBar.tintColor = UIColor.black
        appBar.addSubviewsToParent()

        title = "Material Components"
    
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(ViewController.barButtonDidTap(_:)))
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        if let textCell = cell as? MDCCollectionViewTextCell {
            let animals = ["Lions", "Tigers", "Bears", "Monkeys"]
            textCell.textLabel?.text = animals[indexPath.item]
        }

        return cell
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == appBar.headerViewController.headerView.trackingScrollView {
            appBar.headerViewController.headerView.trackingScrollDidScroll()
        }
    }

    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == appBar.headerViewController.headerView.trackingScrollView {
            appBar.headerViewController.headerView.trackingScrollDidEndDecelerating()
        }
    }

    func barButtonDidTap(sender: UIBarButtonItem) {
        editor.isEditing = !editor.isEditing
        
        let buttonTitle =  editor.isEditing ? "Cancel" : "Edit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: buttonTitle,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(ViewController.barButtonDidTap(_:)))
    }
}
