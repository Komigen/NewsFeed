import UIKit

protocol AlertsBuilder: AnyObject {
    
    func createErrorAlert(title: String, message: String) -> UIViewController
}


class createObjects: AlertsBuilder {
    
    var someVC: UIViewController?
    
    func createErrorAlert(title: String, message: String) -> UIViewController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        
        return alertController
    }
}
