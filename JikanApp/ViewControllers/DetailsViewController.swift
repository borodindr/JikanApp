//
//  DetailsViewController.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit
import Combine

class DetailsViewController<ViewModel>: UIViewController where ViewModel: AnyDetailsViewModel {
    
    // MARK: - Public properties
    
    var contentView: DetailsView {
        view as! DetailsView
    }
    
    // MARK: - Private properties
    
    private let viewModel: ViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    
    // MARK: - Initializers
    
    init(modelID: ViewModel.APIService.ModelType.IDType, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = DetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBindings()
    }
    
    func updateView(with item: ViewModel.APIService.ModelType) {
        print("Warn: Method `updateView(with:)` was not implemented")
    }
    
    
    // MARK: - Private methods
    
    private func addBindings() {
        // Sink searched items to update table
        viewModel.item
            .sink { [weak self] item in
                self?.updateView(with: item)
            }
            .store(in: &subscriptions)
        
        // Sink view model's isLoading state to stop/start a loader
        viewModel.isLoading
            .sink(receiveValue: { [contentView] isLoading in
                if isLoading {
                    contentView.loader.startAnimating()
                } else {
                    contentView.loader.stopAnimating()
                }
                contentView.tempNameLabel.isHidden = isLoading
            })
            .store(in: &subscriptions)
    }
    
}
