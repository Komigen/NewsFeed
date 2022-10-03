import UIKit

class FirstVCCell: UITableViewCell {
    
    @IBOutlet weak var titleText: UILabel! {
        didSet {
            titleText.font.withSize(17.0)
            
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: titleText.textColor = UIColor.blackCustom
                print("Presented light display mode on RateVc")
            case 1: titleText.textColor = UIColor.whiteCustom
                print("Presented dark display mode on RateVc")
            default: break
            }
        }
    }
    
    @IBOutlet weak var authorText: UILabel! {
        didSet {
            authorText.font.withSize(13.0)
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: authorText.textColor = UIColor.blackCustom
            case 1: authorText.textColor = UIColor.whiteCustom
            default: break
            }
        }
    }
    
    @IBOutlet weak var imagePost: UIImageView! {
        didSet {
            imagePost.layer.cornerRadius = 8.0
            imagePost.clipsToBounds = true
            imagePost.contentMode = .scaleAspectFill
            switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            case 0: imagePost.backgroundColor = UIColor.whiteCustom
            case 1: imagePost.backgroundColor = UIColor.blackCustom
            default: break
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}




