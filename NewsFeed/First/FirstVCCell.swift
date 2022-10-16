import UIKit

class FirstVCCell: UITableViewCell {
    
    @IBOutlet weak var titleText: UILabel! {
        didSet {
            titleText.font.withSize(17.0)
            
            switch userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool ?? true {
            case true: titleText.textColor = UIColor.blackCustom
                print("Presented light display mode on RateVc")
            case false: titleText.textColor = UIColor.whiteCustom
                print("Presented dark display mode on RateVc")
            }
        }
    }
    
    @IBOutlet weak var authorText: UILabel! {
        didSet {
            authorText.font.withSize(13.0)
            authorText.textColor = UIColor.systemGrayCustom
        }
    }
    
    @IBOutlet weak var imagePost: UIImageView! {
        didSet {
            imagePost.layer.cornerRadius = 8.0
            imagePost.clipsToBounds = true
            imagePost.contentMode = .scaleAspectFill
            switch userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool ?? true {
            case true:  imagePost.backgroundColor = UIColor.whiteCustom
            case false: imagePost.backgroundColor = UIColor.blackCustom
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}




