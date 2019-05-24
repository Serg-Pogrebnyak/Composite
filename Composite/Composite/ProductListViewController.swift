//
//  ProductListViewController.swift
//  Composite
//
//  Created by Sergey Pohrebnuak on 5/23/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var priceLabel: UILabel!
    @IBOutlet fileprivate weak var backButton: UIButton!
    fileprivate var productArray = [NovaPoshta]()
    fileprivate var folderFlow = [NovaPoshta]()
    
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
        let newFolder = Folder(name: "New Folder")
        productArray.append(newFolder)
        folderFlow.last?.addComponent(new: newFolder)
        tableView.reloadData()
    }
    
    @IBAction func createProduct(_ sender: Any) {
        let newProduct = Product(name: "New Product", price: 10)
        productArray.append(newProduct)
        folderFlow.last?.addComponent(new: newProduct)
        priceLabel.text = "price \(folderFlow.last!.price)"
        tableView.reloadData()
    }
    
    @IBAction func backButton(_ sender: Any) {
        if folderFlow.count >= 2 {
            priceLabel.text = "price \(folderFlow.last!.price)"
            folderFlow.removeLast()
            productArray = folderFlow.last!.showContent()!
            tableView.reloadData()
        } else if folderFlow.count == 1 {
            priceLabel.text = "price \(folderFlow.last!.price)"
            productArray = folderFlow
            folderFlow.removeLast()
            backButton.isEnabled = false
            tableView.reloadData()
        }
    }
    
    @IBAction func editTable(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.setDataInCell(item: productArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if productArray[indexPath.row].contentCount() ?? -1 >= 0 {
            tableView.deselectRow(at: indexPath, animated: false)
            folderFlow.append(productArray[indexPath.row])
            productArray = productArray[indexPath.row].showContent()!
            backButton.isEnabled = true
            priceLabel.text = "price \(folderFlow.last!.price)"
            print(folderFlow)
            tableView.reloadData()
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    //cell moving
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        (folderFlow.last! as! Folder).switchSomeProduct(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
