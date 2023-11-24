import Fluent
import Vapor

func routes(_ app: Application) throws {
    let api = app.routes.grouped("api")
    
    api.get { req async throws -> String in
        "ok"
    }
    
    try api.register(collection: NotesController())
}
