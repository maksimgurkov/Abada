import ProjectDescription

let swiftLintScript = """
if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which swiftlint >/dev/null; then
  swiftlint --fix --format
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
"""

let target = Target(
    name: "Abada",
    platform: .iOS,
    product: .app,
    bundleId: "maksim.gurkov.Abada",
    deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
    infoPlist: "Abada/Info.plist",
    sources: ["Abada/Sources/**"],
    resources: ["Abada/Resources/**"],
    scripts: [TargetScript.post(script: swiftLintScript, name: "swiftLintScript")],
    dependencies: [
        .project(target: "AbadaDI", path: "AbadaDI"),
        .project(target: "AbadaCore", path: "AbadaCore"),
        .project(target: "AbadaUI", path: "AbadaUI")
    ]
)

let project = Project(
    name: "Abada",
    settings: Settings.settings(
        base: SettingsDictionary().setProjectVersions(),
        defaultSettings: .recommended
    ),
    targets: [target]
)

extension SettingsDictionary {
    func setProjectVersions() -> SettingsDictionary {
        let currentProjectVersion = "1"
        let markettingVersion = "1.0"
        return appleGenericVersioningSystem().merging([
            "CURRENT_PROJECT_VERSION": SettingValue(stringLiteral: currentProjectVersion),
            "MARKETING_VERSION": SettingValue(stringLiteral: markettingVersion)
        ])
    }
}
