//
//  ViewController.swift
//  taity_birthday
//
//  Created by 荒川陸 on 2016/08/30.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var correctCellRow: Int!
    let numberOfCell = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: "Cell")
        
        initializeGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCell
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        if indexPath.row == correctCellRow {
            cell.setUp(true)
        } else {
            cell.setUp(false)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        showAnswerAlertOnView(indexPath.row)
    }
    
}

extension ViewController {
    
    private func initializeGame() {
        correctCellRow = Int(arc4random()) % numberOfCell
        collectionView.reloadData()
    }
    
    private func showAnswerAlertOnView(selectedCellRow: Int) {
        let title = selectedCellRow == correctCellRow ? "正解" : "はずれ"
        let message = selectedCellRow == correctCellRow ? "それはたいてぃです。" : "それはゴリラです。"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: {
            self.initializeGame()
        })
    }
}
