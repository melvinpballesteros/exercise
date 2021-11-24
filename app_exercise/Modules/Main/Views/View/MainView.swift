//
//  MainView.swift
//  app_exercise
//
//  Created by Melvin Ballesteros on 11/25/21.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    var viewModel = MainViewModel()
    
    public var tapSearchButton:(()->Void)?
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search on"
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.darkText, for: .normal)
        button.addTarget(self, action: #selector(userClickSearch), for: .touchUpInside)
        return button
    }()
    
    lazy var flowLayout: UICollectionViewLayout = {
        let itemSizeWidth: CGFloat = (UIScreen.main.bounds.size.width - (4*15)) / 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: itemSizeWidth, height: itemSizeWidth)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    //**************************************************************
    // MARK: - Main
    //**************************************************************
    internal override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //**************************************************************
    // MARK: - Setup
    //**************************************************************
    private func setupViews() {
        self.setSubviewForAutoLayout(
            searchTextField,
            searchButton,
            collectionView
        )
    }
    
    private func setupConstraints() {
        
        searchButton.snp.makeConstraints { (make) in
            make.topMargin.equalTo(20)
            make.width.equalTo(100)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(44)
        }
        
        searchTextField.snp.makeConstraints { (make) in
            make.topMargin.equalTo(20)
            make.left.equalTo(10)
            make.right.equalTo(searchButton.snp.leftMargin).offset(-20)
            make.height.equalTo(44)
            
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.topMargin.equalTo(searchTextField.snp.bottom).offset(16)
            make.bottomMargin.equalTo(safeAreaInsets.bottom)
        }
    }
    
    @objc
    private func userClickSearch() {
        searchTextField.endEditing(true)
        self.tapSearchButton!()
    }

}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        cell.imageUrl = viewModel.getImageUrl(indexRow: indexPath.row)
        return cell
    }
    
    
}

