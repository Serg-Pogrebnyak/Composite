//
//  Model.swift
//  Composite
//
//  Created by Sergey Pohrebnuak on 5/21/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import Foundation

protocol NovaPoshta {
    var name: String {get set}
    var price: Int {get set}
    func showContent() -> [NovaPoshta]?
    func addComponent(new: NovaPoshta)
    func contentCount() -> Int?
}

class Product: NovaPoshta {
    var price: Int
    
    var name: String
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func showContent() -> [NovaPoshta]? {
        return nil
    }
    
    func addComponent(new: NovaPoshta) {
        fatalError()
    }
    
    func contentCount() -> Int? {
        return nil
    }
}

class Folder: NovaPoshta {
    var price: Int {
        get {
            var totalFolderPrice = 0
            for item in arrayOfContent {
                totalFolderPrice += item.price
            }
            return totalFolderPrice
        }
        set {
            
        }
    }
    
    var name: String
    
    private var arrayOfContent = [NovaPoshta]()
    
    init(name: String) {
        self.name = name
        self.price = 0
    }
    
    func showContent() -> [NovaPoshta]? {
        return arrayOfContent
    }
    
    func addComponent(new: NovaPoshta) {
        self.arrayOfContent.append(new)
    }
    
    func contentCount() -> Int? {
        return self.arrayOfContent.count
    }
}
