import Fluent

struct CreateNote: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("notes")
            .id()
            .field("creation-date", .string, .required)
            .field("symbol-name", .string, .required)
            .field("body", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("notes").delete()
    }
}
