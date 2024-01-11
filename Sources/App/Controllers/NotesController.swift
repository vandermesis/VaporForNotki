import Fluent
import Vapor

struct NotesController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    let notes = routes.grouped("notes")
    notes.get(use: index)
    notes.post(use: create)
    notes.group(":noteID") { note in
      note.delete(use: delete)
    }
  }
  
  func index(req: Request) async throws -> [Note] {
    try await Note.query(on: req.db).all()
  }
  
  func create(req: Request) async throws -> Note {
    let note = try req.content.decode(Note.self)
    try await note.save(on: req.db)
    return note
  }
  
  func delete(req: Request) async throws -> HTTPStatus {
    guard let note = try await Note.find(
      req.parameters.get("noteID"),
      on: req.db
    ) else {
      throw Abort(.notFound)
    }
    try await note.delete(on: req.db)
    return .noContent
  }
}
