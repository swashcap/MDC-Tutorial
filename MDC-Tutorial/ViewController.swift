//
//  ViewController.swift
//  MDC-Tutorial
//
//  Created by Cory Reed on 11/13/17.
//  Copyright © 2017 Cory Reed. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCollections

class ViewController: MDCCollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        styler.cellStyle = .card
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
}
