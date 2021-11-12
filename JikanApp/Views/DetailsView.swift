//
//  DetailsView.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit

final class DetailsView: UIView {
    
    // MARK: - View elements
    
    lazy var tempNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.hidesWhenStopped = true
        return loader
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private methods
    
    private func setupView() {
        tempNameLabel.translatesAutoresizingMaskIntoConstraints = false
        loader.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tempNameLabel)
        addSubview(loader)
        
        NSLayoutConstraint.activate([
            tempNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            tempNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            tempNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
