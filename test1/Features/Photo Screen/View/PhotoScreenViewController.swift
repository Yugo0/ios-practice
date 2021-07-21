//
//  PhotoScreenViewController.swift
//  test1
//
//  Created by Letnja Praksa 5 on 21.7.21..
//

import UIKit

class PhotoScreenViewController: UIViewController {
    
    @IBOutlet weak var photoTableView: UITableView!
    
    let viewModel: PhotoScreenViewModel = PhotoScreenViewModel(repository: RepositoryImplementation())
    
    private var nameObserver: [NSKeyValueObservation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoTableView.register(UINib(nibName: PhotoTableViewCell.reusableIdentifier(), bundle: nil), forCellReuseIdentifier: PhotoTableViewCell.reusableIdentifier())
        observeLiveData()
        viewModel.onViewDidLoad()
    }
    
    private func observeLiveData() {
        nameObserver = [viewModel.observe(\.pictures, options: .new) { _, pictures  in
            if let pictures = pictures.newValue {
                self.photoTableView.dataSource = self
            }
        }]
    }
}

extension PhotoScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pictures!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reusableIdentifier(), for: indexPath) as! PhotoTableViewCell
        if let photos = viewModel.pictures {
            cell.configure(photo: photos[indexPath.row])
        }
        
        return cell
    }
}
