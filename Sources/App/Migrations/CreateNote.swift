import Fluent

struct CreateNote: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("notes")
            .id()
            .field("created_at", .datetime, .required)
            .field("symbol_name", .string)
            .field("body", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("notes").delete()
    }
}
