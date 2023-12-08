import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

public func configure(_ app: Application) async throws {
    app.databases.use(
        .postgres(configuration: .init(
            hostname: Environment.get("DATABASE_HOST") ?? "localhost",
            port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ??
            SQLPostgresConfiguration.ianaPortNumber,
            username: Environment.get("DATABASE_USERNAME") ?? "vandermesis",
            password: Environment.get("DATABASE_PASSWORD") ?? "1k0my0J1",
            database: Environment.get("DATABASE_NAME") ?? "db",
            tls: .prefer(try .init(configuration: .clientDefault)))
        ),
        as: .psql
    )
    app.migrations.add(CreateNote())
    app.logger.logLevel = .debug
    app.views.use(.leaf)
    try await app.autoMigrate()
    try routes(app)
}
