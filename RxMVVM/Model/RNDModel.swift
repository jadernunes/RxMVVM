//
//  RNDViewData.swift
//  RxMVVM
//
//  Created by Jáder Borba Nunes on 01/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

import Foundation
import RxSwift

struct RNDModel {
    
    private var title: String = ""
    
    /// Initialize the Model with title
    ///
    /// - Parameters:
    ///   - title: a String that could be long
    init(title: String = "") {
        self.title = title
    }
    
    /// Return the title of the Model RND
    ///
    /// - Returns: a title Variable that represented by String to expose the observable functions
    func getTitle() -> Variable<String> {
        return Variable<String>(title)
    }
}
