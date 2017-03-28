//
//  CardCell.swift
//  StripeRun
//
//  Created by Brandon Sanchez on 3/28/17.
//  Copyright © 2017 Brandon Sanchez. All rights reserved.
//

import UIKit
import Stripe

class CardCell: UICollectionViewCell {

    @IBOutlet weak var cardBackgroundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //cardBackgroundView.layer.cornerRadius = 1
    }

}
