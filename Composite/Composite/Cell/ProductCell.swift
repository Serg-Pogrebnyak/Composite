//
//  ProductCell.swift
//  Composite
//
//  Created by Sergey Pohrebnuak on 5/21/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var itemImage: UIImageView!
    @IBOutlet fileprivate weak var itemName: UILabel!
    @IBOutlet fileprivate weak var itemType: UILabel!
    
    func setDataInCell(item: NovaPoshta) {
        itemType.text = item is Folder ? "Folder" : "Product"
        itemImage.image = item is Folder ? UIImage.init(named: "box") : UIImage.init(named: "order")
        itemName.text = item.name
        self.backgroundColor = .clear
    }
}
