import Foundation
import UIKit

// MARK: - UIViewController extension

/// This extesion adds some useful functions to UIViewController.
public extension UIViewController {
    /// Use this in viewWillAppear(_:)
    ///
    /// - Parameter tableView: UITableView to be delected.
    func smoothlyDeselectRows(tableView: UITableView) {
        let selectedIndexPaths = tableView.indexPathsForSelectedRows ?? []
        
        if let coordinator = transitionCoordinator {
            coordinator.animateAlongsideTransition(
                in: parent?.view, animation: { coordinatorContext in
                    selectedIndexPaths.forEach {
                        tableView.deselectRow(at: $0, animated: coordinatorContext.isAnimated)
                    }
            }, completion: { coordinatorContext in
                if coordinatorContext.isCancelled {
                    selectedIndexPaths.forEach {
                        tableView.selectRow(at: $0, animated: false, scrollPosition: .none)
                    }
                }
            }
            )
        } else {
            selectedIndexPaths.forEach {
                tableView.deselectRow(at: $0, animated: false)
            }
        }
    }
    
    /// Presents a UIAlertController with a title, message and a set of actions.
    ///
    /// - parameter title: The title of the UIAlerController.
    /// - parameter message: An optional String for the UIAlertController's message.
    /// - parameter actions: An array of actions that will be added to the UIAlertController.
    /// - parameter alertType: The style of the UIAlertController.
    func present(title: String, message: String, actions: [UIAlertAction], alertType: UIAlertController.Style = .alert) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertType)
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
    /// Sets the tab bar visible or not.
    /// This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time.
    ///
    /// - Parameters:
    ///   - visible: Set if visible.
    ///   - animated: Set if the transition must be animated.
    func setTabBarVisible(_ visible: Bool, animated: Bool, duration: TimeInterval = 0.3) {
        let frame = tabBarController?.tabBar.frame
        
        guard isTabBarVisible() != visible, let height = frame?.size.height else {
            return
        }
        
        let offsetY = (visible ? -height : height)
        
        let duration: TimeInterval = (animated ? duration : 0.0)
        
        if let frame = frame {
            UIView.animate(withDuration: duration) {
                self.tabBarController?.tabBar.frame = frame.offsetBy(dx: 0, dy: offsetY)
                return
            }
        }
    }
    
    /// Returns if the tab bar is visible.
    ///
    /// - Returns: Returns if the tab bar is visible.
    func isTabBarVisible() -> Bool {
        guard let tabBarOriginY = tabBarController?.tabBar.frame.origin.y else {
            return false
        }
        
        return tabBarOriginY < view.frame.maxY
    }
}
