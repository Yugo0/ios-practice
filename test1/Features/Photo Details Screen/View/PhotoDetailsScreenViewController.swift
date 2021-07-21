//
//  PhotoDetailsScreenViewController.swift
//  test1
//
//  Created by Letnja Praksa 5 on 21.7.21..
//

import UIKit
import Kingfisher

class PhotoDetailsScreenViewController: UIViewController {
    
    @IBOutlet weak var photoDetailImageView: UIImageView!
    
    @IBOutlet weak var photoTitle: UILabel!
    
    private var nameObserver: [NSKeyValueObservation]!
    
    @IBOutlet weak var photoId: UILabel!
    
    let viewModel: PhotoDetailsScreenViewModel = PhotoDetailsScreenViewModel(repository: RepositoryImplementation())
    
    init(pictureId: Int) {
        super.init(nibName: nil, bundle: nil)
        viewModel.pictureId = pictureId
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeLiveData()
        viewModel.onViewDidLoad()
    }
    
    func observeLiveData() {
        nameObserver = [viewModel.observe(\.picture, options: .new) { _, picture  in
            if let picture = picture.newValue {
                self.photoDetailImageView.kf.setImage(with: URL(string: picture!.url))
                self.photoTitle.text = picture!.title
                self.photoId.text = String(picture!.id)
            }
        }]
    }
}
