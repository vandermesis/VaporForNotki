import Fluent
import Vapor

func routes(_ app: Application) throws {
  // MARK: - Root group routes
  app.get("hello") { req async -> String in
    "hi"
  }

  // MARK: - Api group routes
  let api = app.routes.grouped("api")

  api.get { req async -> String in
    "ok"
  }

  // MARK: - Controllers Register
  try api.register(collection: NotesController())
}
