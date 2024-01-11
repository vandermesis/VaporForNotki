import Vapor
import Fluent

final class Note: Model {
    static let schema = "notes"
    
    @ID
    var id: UUID?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Field(key: "body")
    var body: String
    
    @OptionalField(key: "symbol_name")
    var symbolName: String?
    
    @OptionalField(key: "weather")
    var weather: String?
    
    @OptionalField(key: "temperature")
    var temperature: String?
    
    @OptionalField(key: "coordinates")
    var coordinates: String?
    
    @OptionalField(key: "localization_name")
    var localizationName: String?
    
    // TODO: - Expand
    @OptionalField(key: "phone_data")
    var phoneData: String?
    
    // TODO: - Expand
    @OptionalField(key: "health_data")
    var healthData: String?
    
    init() {}
    
    init(
        id: UUID? = nil,
        createdAt: Date?,
        body: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.body = body
    }
}

extension Note: Content {}
