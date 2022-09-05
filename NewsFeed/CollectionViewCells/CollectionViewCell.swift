//
//  CollectionViewCell.swift
//  NewsFeed
//
//  Created by Konstantin on 01.09.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(data: Data) {
//        self.imageNews.image = data.image
    }

}
