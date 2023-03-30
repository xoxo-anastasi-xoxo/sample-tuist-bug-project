// swiftlint:disable force_unwrapping multiline_function_chains

import Foundation

#if !SWIFT_PACKAGE
import UIKit

private class BundleFinder {}

extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var module: Bundle = {
        let bundleName = "XoxoAssets"

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,
            
            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,
            
            // For command-line tools.
            Bundle.main.bundleURL
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        
        // For test app
        return Bundle.main
    }()
}
#endif


extension Foundation.Bundle {
    /// Workaround for making `Bundle.module` work in SwiftUI previews. See: https://stackoverflow.com/a/65789298
    ///
    /// - Returns: The bundle of the target with a path that works in SwiftUI previews, too.
    static var swiftUIPreviewsCompatibleModule: Bundle {
        #if DEBUG
        // adjust these for each module
        let packageName = "XoxoDependencies"
        let targetName = "XoxoAssets"

        final class ModuleToken {}

        let candidateUrls: [URL?] = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,
            
            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: ModuleToken.self).resourceURL,
            
            // For command-line tools.
            Bundle.main.bundleURL,
            
            // Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/").
            Bundle(for: ModuleToken.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent()
                .deletingLastPathComponent(),
            Bundle(for: ModuleToken.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent()
        ]

        // The name of your local package, prepended by "LocalPackages_" for iOS and "PackageName_" for macOS.
        let bundleNameCandidates = ["\(packageName)_\(targetName)", "LocalPackages_\(targetName)"]

        for bundleNameCandidate in bundleNameCandidates {
            for candidateUrl in candidateUrls where candidateUrl != nil {
                let bundlePath: URL = candidateUrl!.appendingPathComponent(bundleNameCandidate)
                    .appendingPathExtension("bundle")
                if let bundle = Bundle(url: bundlePath) { return bundle }
            }
        }

        return Bundle.module
        #else
        return Bundle.module
        #endif
    }
}
