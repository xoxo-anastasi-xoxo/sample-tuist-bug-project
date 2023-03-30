// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
import Foundation

// MARK: - Swift Bundle Accessor

private class BundleFinder {}

extension Foundation.Bundle {
    /// Since XoxoToast is a staticFramework, the bundle containing the resources is copied into the final product.
    static let module: Bundle = {
        let bundleName = "XoxoDependencies_XoxoToast"

        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BundleFinder.self).resourceURL,
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named XoxoDependencies_XoxoToast")
    }()
}

// MARK: - Objective-C Bundle Accessor

@objc
public class XoxoToastResources: NSObject {
    @objc public class var bundle: Bundle {
        return .module
    }
}
// swiftlint:enable all
// swiftformat:enable all
