import UIKit

//MARK: Animated tableView

extension UITableView {
    
    public func animateTableView() {
        self.reloadData()
        
        let cells = self.visibleCells
        let tableViewHeight = self.bounds.height
        var delay = 0.0
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
            
            UIView.animate(withDuration: 1.5,
                           delay: delay * 0.05,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut,
                           animations: {
                cell.transform = CGAffineTransform.identity
            })
            delay += 0.7
        }
    }
}
