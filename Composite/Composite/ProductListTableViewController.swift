//
//  ProductListTableViewController.swift
//  Composite
//
//  Created by Sergey Pohrebnuak on 5/21/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class ProductListTableViewController: UITableViewController {

    private var productArray = [NovaPoshta]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "ProductCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductCell")
        
        productArray.append(Product(name: "Pen"))
        productArray.append(Product(name: "Pencil"))
        productArray.append(Folder(name: "Middle"))
        productArray.append(Product(name: "Book"))
        productArray.append(Folder(name: "Big"))
        productArray.append(Folder(name: "Small"))
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.setDataInCell(item: productArray[indexPath.row])
        return cell
    }
}
