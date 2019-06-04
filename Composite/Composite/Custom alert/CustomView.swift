//
//  CustomAlert.swift
//  Composite
//
//  Created by Sergey Pohrebnuak on 6/3/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet fileprivate weak var labelPrice: UILabel!
    @IBOutlet fileprivate weak var labelName: UILabel!
    @IBOutlet fileprivate weak var image: UIImageView!
    
    @IBAction func didTapButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    func setDataInView(product: NovaPoshta) {
        labelName.text = product.name
        labelPrice.text = String(product.price)
        image.image = UIImage.init(named: "product")
    }
}
