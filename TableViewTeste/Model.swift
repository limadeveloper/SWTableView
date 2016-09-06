//
//  Model.swift
//  TableViewTeste
//
//  Created by John Lima on 06/09/16.
//  Copyright © 2016 limadeveloper. All rights reserved.
//

import Foundation

class Model {
    
    var name: String?
    var id: Int?
    var color: String?
    
    init() {}
    
    init(name: String, id: Int, color: String) {
        self.name = name
        self.id = id
        self.color = color
    }
}

extension Model {
    
    func getData() -> [Model] {
        return [
            Model(name: "Nome 1", id: 1, color: "#000000"),
            Model(name: "Nome 2", id: 2, color: "#0000ff"),
            Model(name: "Nome 3", id: 3, color: "#00ffcc"),
            Model(name: "Nome 4", id: 4, color: "#00aacc"),
            Model(name: "Nome 5", id: 5, color: "#FF0034")
        ]
    }
}