import Fluent

struct CreateNote: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("notes")
            .id()
            .field("created_at", .datetime, .required)
            .field("body", .string, .required)
            .field("symbol_name", .string)
            .field("weather", .string)
            .field("temperature", .string)
            .field("coordinates", .string)
            .field("localization_name", .string)
            .field("phone_data", .string)
            .field("health_data", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("notes").delete()
    }
}
