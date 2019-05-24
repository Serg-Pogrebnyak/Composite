//
//  SaverAndReader.swift
//  Composite
//
//  Created by Sergey Pohrebnuak on 5/24/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

struct SaverAndReader {
    
    func getArrayOfFolder() -> [NovaPoshta] {
        if UserDefaults.standard.object(forKey: "product") != nil {
            let decoded  = UserDefaults.standard.data(forKey: "product")
            let decode = (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded!)) as? [NovaPoshta]
            return decode != nil ? decode! : getArrayOfFolder()
        } else {
            return getDefaultFolder()
        }
    }
    
    func saveProductAndFolder(_ item: NovaPoshta) {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = try! NSKeyedArchiver.archivedData(withRootObject: [item], requiringSecureCoding: false)
        userDefaults.set(encodedData, forKey: "product")
        userDefaults.synchronize()
    }
    
    fileprivate func getDefaultFolder() -> [NovaPoshta] {
        let myFoolder: NovaPoshta = Folder(name: "My Foolder")
        
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
        return [myFoolder]
    }
}
