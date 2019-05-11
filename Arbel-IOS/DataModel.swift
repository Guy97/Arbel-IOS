//
//  DataModel.swift
//  Arbel-IOS
//
//  Created by Simone on 11/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

class DataModel {
    var headerName: String?
    var subType = [String]()
    var isExpandable: Bool = false
    
    init(headerName: String, subType: [String], isExpandable: Bool ) {
        self.headerName = headerName
        self.subType = subType
        self.isExpandable = isExpandable
    }
}
