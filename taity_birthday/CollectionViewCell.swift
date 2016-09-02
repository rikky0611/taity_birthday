//
//  CollectionViewCell.swift
//  taity_birthday
//
//  Created by 荒川陸 on 2016/08/30.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(isCorrectCell: Bool) {
        setAnimation()
        setImage(isCorrectCell)
    }
    
    private func setImage(isCorrectCell: Bool) {
        imageView.backgroundColor = UIColor.redColor()
        var imageArray: [UIImage] = []
        if !isCorrectCell {
            imageArray = GorillaImages
        } else {
            imageArray = TaityImages
        }
        let index = Int(arc4random()) % imageArray.count
        imageView.image = imageArray[index]
    }
    
    private func setAnimation() {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform")
        animation.duration = drand48()+0.1
        animation.repeatCount = 1000
        animation.autoreverses = true
        
        let transform : CATransform3D = CATransform3DMakeRotation(CGFloat(M_PI),  0.0, 0.5, 0.0)
        animation.toValue = NSValue(CATransform3D : transform)
        
        self.layer.addAnimation(animation, forKey: "transform")
    }

}
