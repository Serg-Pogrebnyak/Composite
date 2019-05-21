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
    func showContent() -> Any?
    func addComponent(new: NovaPoshta)
    func contentCount() -> Int?
}

class Product: NovaPoshta {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any? {
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
    var name: String
    
    private var arrayOfContent = [NovaPoshta]()
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any? {
        return arrayOfContent
    }
    
    func addComponent(new: NovaPoshta) {
        self.arrayOfContent.append(new)
    }
    
    func contentCount() -> Int? {
        return self.arrayOfContent.count
    }
    
    
}
