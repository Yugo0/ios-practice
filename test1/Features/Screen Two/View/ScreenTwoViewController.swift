//
//  ScreenTwoViewController.swift
//  test1
//
//  Created by Letnja Praksa 5 on 19.7.21..
//

import UIKit
import Kingfisher

class ScreenTwoViewController: UIViewController {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catNameLabel: UILabel!
    
    private var nameObserver: [NSKeyValueObservation]!
    
    let viewModel: ScreenTwoViewModel = ScreenTwoViewModel(repository: RepositoryImplementation())
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        navigationController!.show(PhotoScreenViewController(), sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeLiveData();
        viewModel.onViewDidLoad()
    }
    
    private func observeLiveData() {
        nameObserver = [viewModel.observe(\.animals, options: .new) { _, animals  in
            if let animals = animals.newValue {
                self.catNameLabel.text = animals?[0].name
                self.catImageView.kf.setImage(with: URL(string: (animals?[0].imageUrl)!))
            }
        }]
    }
}
