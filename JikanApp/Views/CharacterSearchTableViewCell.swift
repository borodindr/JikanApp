//
//  CharacterSearchTableViewCell.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit
import Combine

final class CharacterSearchTableViewCell: UITableViewCell {
    
    // MARK: - Private methods
    // Keep reference to subscription of image loading in order to cancel it in case of cell use
    private var imageLoadingSubscription: AnyCancellable?
    
    
    // MARK: - View elements
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "person")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .callout)
        return label
    }()
    
    lazy var alternativeNamesLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .callout)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Cancel existing subscription of image loading
        imageLoadingSubscription?.cancel()
        // Get rid of the subscription
        imageLoadingSubscription = nil
    }
    
    // Consider to move this method to separate cell's view model
    /// Tells cell to start loading the image from provided URL
    func loadImage(from imageURL: URL) {
        imageLoadingSubscription = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map(\.data)
            .receive(on: DispatchQueue.main)
            .map { UIImage(data: $0) }
            .replaceError(with: UIImage(systemName: "person")) // In case of error, just set default image
            .assign(to: \.image, on: characterImageView)
    }
    
    
    // MARK: - Private methods
    
    // TODO: refactor
    private func setupView() {
        let infoStackView = UIStackView(arrangedSubviews: [
            nameLabel,
            alternativeNamesLabel
        ])
        infoStackView.axis = .vertical
        infoStackView.spacing = 16
        
        let mainStackView = UIStackView(arrangedSubviews: [
            characterImageView,
            infoStackView
        ])
        mainStackView.axis = .horizontal
        mainStackView.spacing = 8
        mainStackView.alignment = .center
        
        [nameLabel,
         alternativeNamesLabel].forEach {
            $0.setContentHuggingPriority(.required, for: .vertical)
            $0.setContentCompressionResistancePriority(.required, for: .vertical)
        }
        
        contentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let aspectRation: CGFloat = 3/2
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            characterImageView.heightAnchor.constraint(equalToConstant: 56),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor, multiplier: aspectRation)
        ])
    }
}
