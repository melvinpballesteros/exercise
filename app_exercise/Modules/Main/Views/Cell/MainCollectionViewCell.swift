//
//  MainCollectionViewCell.swift
//  app_exercise
//
//  Created by Melvin Ballesteros on 11/25/21.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {

    var imageUrl: String? {
        didSet {
            guard let imageUrl = imageUrl else {return}
            loadImage(url: imageUrl)
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    //*****************************************************************
    // MARK: - OVERRIDE FUNCTIONS
    //*****************************************************************
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.setSubviewForAutoLayout(
            imageView
        )
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    private func loadImage(url: String) {
        let url = URL(string: imageUrl!)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ], completionHandler: {result in})
    }
    
    
}
