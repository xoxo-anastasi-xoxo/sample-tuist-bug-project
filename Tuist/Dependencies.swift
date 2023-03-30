import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .local(path: .relativeToRoot("libs"))
        ],
        baseSettings: Settings.settings(
            configurations: [
                .debug(name: "Debug"),
                .debug(name: "TestRun"),
                .release(name: "Release")
            ]
        ),
        projectOptions: [
            "XoxoDependencies": .options(
                automaticSchemesOptions: .disabled,
                disableSynthesizedResourceAccessors: true
            )
        ]
    ),
    platforms: [.tvOS]
)
