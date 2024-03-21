import ProjectDescription

extension Project {

    public static func feature(
        name: String,
        packages: [Package],
        dependencies: [TargetDependency]
    ) -> Self {
        Self(
            name: name,
            packages: packages,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .staticFramework,
                    bundleId: "maksim.gurkov.\(name)",
                    deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
                    infoPlist: .default,
                    sources: ["\(name)/Sources/**"],
                    dependencies: dependencies
                )
            ]
        )
    }
}
