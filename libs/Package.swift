// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "XoxoDependencies",
    defaultLocalization: "ru",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14)
    ],
    
    // MARK: - Products

    products: [
        .library(
            name: "XoxoAssetsMobile",
            targets: [
                "XoxoAssets",
                "XoxoAssetsMobile"
            ]
        ),
        
        .library(
            name: "XoxoAssetsTV",
            targets: [
                "XoxoAssets",
                "XoxoAssetsTV"
            ]
        ),
        
        
        .library(
            name: "XoxoToast",
            targets: [
                "XoxoToast"
            ]
        )
    ],
    
    // MARK: - Dependencies

    dependencies: [

        .package(
            url: "https://github.com/Alamofire/Alamofire",
            from: "5.2.0"
        ),
        
        .package(
            url: "https://github.com/apollographql/apollo-ios",
            from: "0.30.0"
        ),
        
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk",
            from: "8.10.0"
        ),
        
        .package(
            url: "https://github.com/kishikawakatsumi/KeychainAccess",
            from: "4.2.2"
        ),
        
        .package(
            url: "https://github.com/onevcat/Kingfisher",
            from: "7.1.2"
        )
    ],
    
    // MARK: - Targets

    targets: [
        .target(
            name: "XoxoAssets",
            dependencies: [],
            path: "XoxoAssets/XoxoAssets"
        ),
        
        .target(
            name: "XoxoAssetsMobile",
            dependencies: [
                "XoxoAssets"
            ],
            path: "XoxoAssets/XoxoAssetsMobile"
        ),
        
        .target(
            name: "XoxoAssetsTV",
            dependencies: [
                "XoxoAssets"
            ],
            path: "XoxoAssets/XoxoAssetsTV"
        ),

        .target(
            name: "XoxoToast",
            dependencies: [
                .target(name: "XoxoAssetsMobile", condition: .when(platforms: [.iOS])),
                .target(name: "XoxoAssetsTV", condition: .when(platforms: [.tvOS]))
            ],
            path: "XoxoToast/XoxoToast"
        )
    ]
)
