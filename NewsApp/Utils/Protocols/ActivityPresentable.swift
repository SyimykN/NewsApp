import UIKit

protocol ActivityPresentable: InteractionBlockable {
    func presentActivity()
    func dismissActivity()
}

extension ActivityPresentable where Self: UIViewController {
    func presentActivity() {
        disableInteraction()
        if let activityIndicator = findActivityIndicator() {
            activityIndicator.show()
        } else {
            let activityIndicator = ActivityIndicatorOverlayView()
            activityIndicator.frame = view.frame
            view.addSubview(activityIndicator)
            
            activityIndicator.anchor(
                .centerY(view.centerYAnchor),
                .centerX(view.centerXAnchor)
            )
            
            activityIndicator.show()
        }
    }
    
    func dismissActivity() {
        enableInteraction()
        findActivityIndicator()?.hide()
    }
    
    func findActivityIndicator() -> ActivityIndicatorOverlayView? {
        return view.subviews
            .compactMap { $0 as? ActivityIndicatorOverlayView }
            .first
    }
}
