import Fluent
import Vapor

func routes(_ app: Application) throws {
    let api = app.routes.grouped("api")
    
    api.get { req async -> String in
        "ok"
    }
    
    app.get("hello") { req async -> String in
        "hi"
    }
    
    try api.register(collection: NotesController())
}
