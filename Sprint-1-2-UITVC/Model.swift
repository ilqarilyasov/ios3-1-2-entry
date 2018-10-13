//
//  Model.swift
//  Sprint-1-2-UITVC
//
//  Created by Ilgar Ilyasov on 10/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Model {
    static let shared = Model()
    private init() {} // This doesn't let anyone to create an instance of the model.
    // So it guarantees that there will be only one model.
    
    var items: [Entry] = []
}
