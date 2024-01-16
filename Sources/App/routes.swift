import Fluent
import Vapor

func routes(_ app: Application) throws {
  // MARK: - Root routes
  try app.register(collection: WebsiteController())
  
  // MARK: - API group routes
  let api = app.routes.grouped("api")
  try api.register(collection: NotesController())
}
