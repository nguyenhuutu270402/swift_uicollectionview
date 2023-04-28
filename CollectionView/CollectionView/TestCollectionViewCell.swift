//
//  TestCollectionViewCell.swift
//  CollectionView
//
//  Created by Thien on 28/04/2023.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    static let identifier = "TestCollectionViewCell"
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "meo")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        applyConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
        
    }
    
    private func applyConstraints() {
        let constraints = [
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    
//    public func configure(with model: String){
//        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") {
//            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//                DispatchQueue.main.async {
//                    self.posterImageView.image = UIImage(data: data!)
//                }
//            }
//            task.resume()
//        }
//    }
    
}
