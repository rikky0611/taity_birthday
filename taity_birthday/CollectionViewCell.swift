//
//  CollectionViewCell.swift
//  taity_birthday
//
//  Created by 荒川陸 on 2016/08/30.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp() {
        setAnimation()
        setImage()
    }
    
    private func setImage() {
        imageView.backgroundColor = UIColor.redColor()
    }
    
    private func setAnimation() {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform")
        animation.duration = 0.5
        animation.repeatCount = 5
        animation.autoreverses = true
        
        let transform : CATransform3D = CATransform3DMakeRotation(CGFloat(M_PI),  0.0, 0.5, 0.0)
        animation.toValue = NSValue(CATransform3D : transform)
        
        self.layer.addAnimation(animation, forKey: "transform")
    }

}
