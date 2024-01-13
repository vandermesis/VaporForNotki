// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "Notki",
  platforms: [
    .macOS(.v13)
  ],
  dependencies: [
    // 💧 A server-side Swift web framework.
    .package(url: "https://github.com/vapor/vapor.git", from: "4.83.1"),
    // 🗄 An ORM for SQL and NoSQL databases.
    .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
    // 🐘 Fluent driver for Postgres.
    .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.7.2"),
    // 🍃 An expressive, performant, and extensible templating language built for Swift.
    .package(url: "https://github.com/vapor/leaf.git", from: "4.2.4"),
    // A tool to enforce Swift style and conventions.
    .package(url: "https://github.com/realm/SwiftLint.git", from: "0.54.0")
  ],
  targets: [
    .executableTarget(
      name: "App",
      dependencies: [
        .product(name: "Fluent", package: "fluent"),
        .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
        .product(name: "Leaf", package: "leaf"),
        .product(name: "Vapor", package: "vapor"),
      ],
      plugins: [
        .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
      ]
    ),
    .testTarget(name: "AppTests", dependencies: [
      .target(name: "App"),
      .product(name: "XCTVapor", package: "vapor"),

      // Workaround for https://github.com/apple/swift-package-manager/issues/6940
      .product(name: "Vapor", package: "vapor"),
      .product(name: "Fluent", package: "Fluent"),
      .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
      .product(name: "Leaf", package: "leaf"),
    ])
  ]
)
