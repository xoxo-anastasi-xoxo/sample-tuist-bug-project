import Foundation
import UIKit
#if os(iOS)
import XoxoAssetsMobile

enum Images {
    static let error = UIImages.Icons.Size12.cross.withRenderingMode(.alwaysTemplate)
}
#elseif os(tvOS)
enum Images {
    static let error = UIImage.image("error")!.withRenderingMode(.alwaysTemplate) // swiftlint:disable:this force_unwrapping
}

extension UIImage {
    fileprivate static func image(_ name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle.module, with: nil)
    }
}
#endif
