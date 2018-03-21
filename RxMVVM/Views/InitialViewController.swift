//
//  InitialViewController.swift
//  RxMVVM
//
//  Created by Jáder Borba Nunes on 28/02/18.
//  Copyright © 2018 jader. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class InitialViewController: UIViewController {
    
    //MARK: - Variables
    
    /// ViewModel to represent the data
    private var viewModel: RNDViewModel = RNDViewModel()
    
    /// Safe Thread Bag to controll the binds reference
    private var disposeBag = DisposeBag()
    
    //MARK: - Outlets
    
    @IBOutlet weak var labelTitle: UILabel!{
        didSet {
            //Configure layout
            labelTitle.layer.masksToBounds = true
            labelTitle.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!{
        didSet {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    //MARK: - Lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - Custom methods
    
    private func setup(){
        
        viewModel.titleCustom
            .asObservable()
            .bind(to: self.labelTitle.rx.text)
            .disposed(by: self.disposeBag)
        
        viewModel.isLoading
            .asObservable()
            .subscribe(onNext: { (isLoading: Bool) in
                self.activityIndicator.rx.isHidden.onNext(!isLoading)
                UIApplication.shared.rx.isNetworkActivityIndicatorVisible.onNext(isLoading)
            })
            .disposed(by: self.disposeBag)
        
        requestNewData()
    }
    
    private func requestNewData(){
        viewModel.requestNewData()
    }
    
    //MARK: - Actions
    
    @IBAction func buttonRefreshDataPressed(_ sender: UIBarButtonItem) {
        requestNewData()
    }
}

