//
//  CollectionViewCell.swift
//  NewsFeed
//
//  Created by Konstantin on 01.09.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageNews: UIImageView! {
        didSet {
            imageNews.layer.cornerRadius = 7.0
            imageNews.clipsToBounds = true
            imageNews.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var label: UILabel! {
        didSet {
            label.font = UIFont(name: "System", size: 17.0)
            label.textAlignment = .left
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(data: Data) {
    }
}
