import Fluent
import Vapor

func routes(_ app: Application) throws {
  // MARK: - Root group routes
  app.get { req async throws -> View in
    return try await req.view.render("index")
  }

  // MARK: - Api group routes
  let api = app.routes.grouped("api")

  api.get { req async throws -> View in
    return try await req.view.render("api")
  }

  // MARK: - Controllers Register
  try api.register(collection: NotesController())
}
