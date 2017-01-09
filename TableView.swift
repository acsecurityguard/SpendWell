//
//  Operations.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-05.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

var operation: Operations = Operations()

struct Description
{
    var title = "unamed"
    var price = "unpriced"
    var rating = "unrated"
    
}

class Operations: NSObject {

    var descriptions = [Description]()
    
    func addDescription(title: String, price: String, rating: String)
    {
        descriptions.append(Description(title: title, price: price, rating: rating))
    }
}
