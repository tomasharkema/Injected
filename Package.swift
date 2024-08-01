// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swiftSettings: [SwiftSetting] = [
  .enableUpcomingFeature("ConciseMagicFile"),
  .enableUpcomingFeature("BareSlashRegexLiterals"),
  //    .enableUpcomingFeature("ExistentialAny"),
]

// .package(url: "https://github.com/ShenghaiWang/SwiftMacros", from: "1.2.0"),
// .package(url: "https://github.com/securevale/swift-confidential", from: "0.3.0"),
// .package(url: "https://github.com/securevale/swift-confidential-plugin", from: "0.3.0"),

let swiftUiDependency: [Package.Dependency] = [
  .package(url: "https://github.com/realm/SwiftLint", from: "0.53.0"),
]

let swiftUiPlugin: [Target.PluginUsage] = [
  .plugin(name: "SwiftLintPlugin", package: "SwiftLint"),
]

let package = Package(
  name: "Injected",
  platforms: [.macOS(.v14), .iOS(.v17)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to
    // other packages.
    .library(
      name: "Injected",
      targets: ["Injected"]
    ),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "Injected"
    ),
//        .testTarget(
//            name: "InjectedTests",
//            dependencies: ["Injected"]),
  ]
)
