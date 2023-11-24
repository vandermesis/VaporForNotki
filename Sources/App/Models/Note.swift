import Vapor
import Fluent

final class Note: Model {
    static let schema = "notes"
    
    @ID
    var id: UUID?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @OptionalField(key: "symbol_name")
    var symbolName: String?
    
    @Field(key: "body")
    var body: String
    
    init() {}
    
    init(
        id: UUID? = nil,
        createdAt: Date?,
        symbolName: String?,
        body: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.symbolName = symbolName
        self.body = body
    }
}

extension Note: Content {}

