//
//  AnimeSearchTableViewCell.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit
import Combine

final class AnimeSearchTableViewCell: UITableViewCell {
    
    // MARK: - Private methods
    // Keep reference to subscription of image loading in order to cancel it in case of cell use
    private var imageLoadingSubscription: AnyCancellable?
    
    
    // MARK: - View elements
    
    lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "film")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .callout)
        return label
    }()
    
    lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .callout)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    lazy var datePeriodLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    lazy var episodesLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
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
            .replaceError(with: UIImage(systemName: "film")) // In case of error, just set default image
            .assign(to: \.image, on: coverImageView)
    }
    
    
    // MARK: - Private methods
    
    // TODO: refactor
    private func setupView() {
        let infoStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            synopsisLabel,
            datePeriodLabel,
            episodesLabel
        ])
        infoStackView.axis = .vertical
        infoStackView.spacing = 4
        
        let mainStackView = UIStackView(arrangedSubviews: [
            coverImageView,
            infoStackView,
            scoreLabel
        ])
        mainStackView.axis = .horizontal
        mainStackView.spacing = 8
        
        [titleLabel,
         synopsisLabel,
         datePeriodLabel,
         episodesLabel].forEach {
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
            
            coverImageView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor),
            coverImageView.heightAnchor.constraint(equalTo: coverImageView.widthAnchor, multiplier: aspectRation)
        ])
    }
}
