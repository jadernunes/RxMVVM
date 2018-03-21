//
//  RNDViewModel.swift
//  RxMVVM
//
//  Created by Jáder Borba Nunes on 01/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

/// Constants of the RNDViewModel
struct Constants {
    /// Genéric error message when there's no data
    static let genericErrorMessage = "No information found"
}

class RNDViewModel {
    
    /// RNDController protocol reference
    private let delegate: RNDControllerDelegate
    
    /// Contains the random title
    var titleCustom: Variable<String> = Variable<String>("")
    
    /// Control the request loading status. If TRUE will start the loading and FALSE stop that
    var isLoading: Variable<Bool> = Variable<Bool>(true)
    
    /// Initialize the ViewModel with a delegate if it'll be necessary
    ///
    /// - Parameter delegate: Optional RNDController protocol reference. You can override it if will be necessary
    init(delegate: RNDControllerDelegate = RNDController()) {
        self.delegate = delegate
    }
    
    /// Request new updated data to View Model and then it'll update the title
    func requestNewData(){
        
        self.isLoading.value = true
        self.delegate.requestNewData { [unowned self] (model: RNDModel) in
            if model.getTitle().value.isEmpty {
                self.titleCustom.value = Constants.genericErrorMessage
            } else {
                self.titleCustom.value = model.getTitle().value
            }
        
            self.isLoading.value = false
        }
    }
}
