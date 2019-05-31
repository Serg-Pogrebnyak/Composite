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

class Product: NSObject, NovaPoshta, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(price, forKey: "price")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let price = Int(aDecoder.decodeInt32(forKey: "price"))
        self.init(name: name, price: price)
    }
    
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

class Folder: NSObject, NovaPoshta, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(arrayOfContent, forKey: "array")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let array = aDecoder.decodeObject(forKey: "array") as! [NovaPoshta]
        self.init(name: name, array: array)
    }
    
    private init (name: String, array: [NovaPoshta]) {
        self.name = name
        self.arrayOfContent = array
    }
    
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
    
    func switchSomeProduct(from: Int, to: Int) {
        let movedObject = self.arrayOfContent[from]
        arrayOfContent.remove(at: from)
        arrayOfContent.insert(movedObject, at: to)
    }
    
    func removeObject(_ index: Int) {
        self.arrayOfContent.remove(at: index)
    }
}
