import UIKit

//MARK: Settings SearchBar

extension UISearchBar {
    
    public func createSettings() {
        self.layer.cornerRadius = 16.0
        self.clipsToBounds      = true
        self.barTintColor       = UIColor.clear
        self.tintColor          = UIColor.blueLightCustom
        self.alpha = 0.85
        
        self.layer.cornerRadius = 16.0
        self.clipsToBounds      = true
        
        self.layer.borderColor = UIColor.systemGray6.cgColor
        self.layer.borderWidth = 1.0
        
        self.searchTextField.textColor = UIColor.white
        self.searchTextField.backgroundColor = UIColor.clear
    }
}

//MARK: Using this colours. if you have to change the colors, you only need to do this here (Refactor -> Rename)

extension UIColor {
    
    static var blackCustom: UIColor {
        .black
    }
    static var whiteCustom: UIColor {
        .white
    }
    static var systemGrayCustom: UIColor {
        .systemGray
    }
    static var systemGray4Custom: UIColor {
        .systemGray4
    }
    static var systemGray6Custom: UIColor {
        .systemGray6
    }
    static var darkGrayCustom: UIColor {
        .darkGray
    }
    static var pinkLightCustom: UIColor {
        UIColor(red: 247 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1.0)
    }
    static var blueLightCustom: UIColor {
        UIColor(red: 0, green: 122 / 255, blue: 255 / 255, alpha: 0.85)
    }
}
