//
//  Music.swift
//  Johnify
//
//  Created by Junaid KHALID on 16/02/17.
//  Copyright © 2017 Epita. All rights reserved.
//

import Foundation
import UIKit

class Music {
    
    var name: String
    var photo: UIImage?
    var category: String
    
    init(name: String, photo: UIImage?, category: String) {
        self.name = name
        self.photo = photo
        self.category = category
    }
    
}
