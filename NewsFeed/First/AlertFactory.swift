import UIKit

protocol AlertFactory: AnyObject {
    
    func createErrorAlert() -> UIViewController
}


class СreateAlertController: AlertFactory {
    
    var someVC: UIViewController?
    
    func createErrorAlert() -> UIViewController {
        let alertController = UIAlertController(title: "Failed to get data", message: "Check your network connection", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        
        return alertController
    }
}

