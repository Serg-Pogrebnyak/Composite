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
        
        let myFoolder = Folder(name: "My Foolder")
        
        let foolder = Folder(name: "Not big, but not small")
        foolder.addComponent(new: Product(name: "new pen", price: 5))
        foolder.addComponent(new: Product(name: "new pencill", price: 4))
        foolder.addComponent(new: Product(name: "new book", price: 8))
        
        myFoolder.addComponent(new: foolder)

        myFoolder.addComponent(new: Product(name: "Pen", price: 40))
        myFoolder.addComponent(new: Product(name: "Pencil", price: 20))
        myFoolder.addComponent(new: Folder(name: "Middle"))
        myFoolder.addComponent(new: Product(name: "Book", price: 10))
        myFoolder.addComponent(new: Folder(name: "Big"))
        myFoolder.addComponent(new: Folder(name: "Small"))
        
        productArray.append(myFoolder)
        print(myFoolder.price)
        
        tableView.reloadData()
    }
    
    @IBAction func createFolder(_ sender: Any) {
        productArray.append(Folder(name: "New Folder"))
        tableView.reloadData()
    }
    
    @IBAction func createProduct(_ sender: Any) {
        productArray.append(Product(name: "New Product", price: 10))
        tableView.reloadData()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if productArray[indexPath.row].contentCount() ?? -1 >= 0 {
            productArray = productArray[indexPath.row].showContent()!
            print("select boxes")
            tableView.reloadData()
        } else {
            print("no items or this is product")
        }
    }
}
