import Foundation
import UIKit

// MARK: - UIPasteboard extension

/// This extesion adds some useful functions to UIPasteboard.
public extension UIPasteboard {
    // MARK: - Functions
    
    /// Copy a text to the pasteboard.
    ///
    /// - Parameter text: The text to be copy to.
    static func copy(text: String) {
        UIPasteboard.general.string = text
    }
    
    /// Returns the last copied string from pasteboard.
    ///
    /// - Returns: Returns the last copied string from pasteboard.
    static func getString() -> String {
        guard let pasteboard = UIPasteboard.general.string else {
            return ""
        }
        
        return pasteboard
    }
}
