import UIKit

/// ActivityIndicatorView's style. (Deprecated)
///
/// - color: The fill color of activity indicator is set to `color`.
/// - gradationColor: The fill color of activity indicator is gradated from `head` color to `tail` color.
public enum ActivityIndicatorViewStyle {
    case color(UIColor)
    case gradationColor(head: UIColor, tail: UIColor)

    public var headColor: UIColor {
        switch self {
        case let .color(color):  return color
        case let .gradationColor(head: color, tail: _):  return color
        }
    }

    public var tailColor: UIColor {
        switch self {
        case let .color(color):  return color
        case let .gradationColor(head: _, tail: color):  return color
        }
    }
}
