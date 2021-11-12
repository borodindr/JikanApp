//
//  SearchViewController.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit
import Combine

/// Base view controller to handle searching from Jikan API and display result. It should be subclasses by concrete implementation
class SearchViewController<ViewModel>
: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate
where ViewModel: AnySearchViewModel {
    
    // MARK: - Public properties
    
    lazy var searchViewController = UISearchController()
    // Store items separately in View Controller to avoid race conditions
    var items = [ViewModel.SearchAPI.SearchModel]()
    var contentView: SearchView {
        view as! SearchView
    }
    
    // MARK: - Private properties
    
    private let viewModel: ViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    
    // MARK: - Initializers
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = SearchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSearchController()
        prepareTableView()
        addBindings()
        contentView.infoLabel.text = "Start entering text to search..."
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Better behaviour would be not to make a search bar as first responder.
        // However, search bar is initially hidden and you need to scroll view down
        searchViewController.searchBar.becomeFirstResponder()
    }
    
    
    // MARK: - Private methods
    
    private func prepareSearchController() {
        navigationItem.searchController = searchViewController
        searchViewController.searchBar.delegate = self
    }
    
    private func prepareTableView() {
        let tableView = contentView.tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func addBindings() {
        // Sink searched items to update table
        viewModel.searchItems
            .sink { [weak self] items in
                self?.items = items
                self?.contentView.tableView.reloadData()
            }
            .store(in: &subscriptions)
        
        // Hide table view if there are no items to show
        viewModel.searchItems
            .map { $0.isEmpty }
            .assign(to: \.isHidden, on: contentView.tableView)
            .store(in: &subscriptions)
        
        // Hide info label if either items are not empty or view model is in loading state
        Publishers.CombineLatest(
            viewModel.searchItems,
            viewModel.isLoading
        )
            .map { !$0.isEmpty || $1}
            .assign(to: \.isHidden, on: contentView.infoLabel)
            .store(in: &subscriptions)
        
        // Sink view model's isLoading state to stop/start a loader
        viewModel.isLoading
            .sink(receiveValue: { [contentView] isLoading in
                if isLoading {
                    contentView.loader.startAnimating()
                } else {
                    contentView.loader.stopAnimating()
                }
            })
            .store(in: &subscriptions)
    }
    
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Send new search query to view model
        viewModel.searchQuerySubject.send(searchText)
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Placeholder. This implementation should be changed by subclasses
        UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
}
