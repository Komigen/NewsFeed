import UIKit

//MARK: Settings SearchBar

extension UISearchBar {
    
    public func createSettings() {
        self.layer.cornerRadius = 16.0
        self.clipsToBounds = true
        self.barTintColor = UIColor.clear
        self.tintColor = UIColor.blueLightCustom
        self.alpha = 0.85
        
        self.layer.cornerRadius = 16.0
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.systemGray6.cgColor
        self.layer.borderWidth = 1.0
        
        self.searchTextField.textColor = UIColor.white
        self.searchTextField.backgroundColor = UIColor.clear
    }
}


