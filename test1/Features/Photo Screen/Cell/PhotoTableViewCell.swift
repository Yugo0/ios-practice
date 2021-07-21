//
//  PhotoTableViewCell.swift
//  test1
//
//  Created by Letnja Praksa 5 on 21.7.21..
//

import UIKit
import Kingfisher

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(photo: Picture) {
        photoImageView.kf.setImage(with: URL(string: photo.thumbnailUrl))
        titleLabel.text = photo.title
    }
}

extension UITableViewCell {
    static func reusableIdentifier() -> String {
        String(describing: Self.self)
    }
}
