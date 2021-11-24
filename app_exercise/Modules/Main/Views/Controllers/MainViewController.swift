//
//  MainViewController.swift
//  app_exercise
//
//  Created by Melvin Ballesteros on 11/25/21.
//

import UIKit
import JGProgressHUD

class MainViewController: UIViewController {

    //*****************************************************************
    // MARK: - Initialization
    //*****************************************************************
    lazy var mainView: MainView = {
        let view = MainView()
        
        view.tapSearchButton = {
            self.fetchImages()
        }
        
        return view
    }()
    
    let viewModel = MainViewModel()

    //*****************************************************************
    // MARK: - View Delegates
    //*****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    //*****************************************************************
    // MARK: - Functions
    //*****************************************************************
   
    private func fetchImages() {
        guard let searchKeyword = mainView.searchTextField.text else { return }

        let activityProgressView = JGProgressHUD(style: .dark)
        activityProgressView.textLabel.text = "Loading"
        activityProgressView.show(in: self.view, animated: true)

        viewModel.fetchImageList(withKeyword: searchKeyword) { (error) in
            if error == nil {
                self.mainView.viewModel = self.viewModel
                self.mainView.collectionView.reloadData()
                activityProgressView.dismiss(animated: true)
            } else {
                activityProgressView.textLabel.text = error?.localizedDescription
            }
        }
    }


}
