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
                Target.target(
                    name: name,
                    destinations: .iOS,
                    product: .staticFramework,
                    bundleId: "maksim.gurkov.\(name)",
                    deploymentTargets: .iOS("14.0"),
                    infoPlist: .default,
                    sources: ["\(name)/Sources/**"],
                    dependencies: dependencies
                )
            ]
        )
    }
}
