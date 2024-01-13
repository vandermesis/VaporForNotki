import Fluent
import Vapor

struct NotesController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    let notes = routes.grouped("notes")
    notes.get(use: index).description("List notes")
    notes.post(use: create).description("Create note")
    notes.group(":noteID") { note in
      note.get(use: find).description("Get note")
      note.put(use: update).description("Update note")
      note.delete(use: delete).description("Delete note")
    }
  }

  func index(req: Request) async throws -> [Note] {
    try await Note.query(on: req.db).all()
  }

  func find(req: Request) async throws -> Note {
    guard let note = try await Note.find(
      req.parameters.get("noteID"),
      on: req.db)
      .wrapped else {
      throw Abort(.notFound)
    }
    return note
  }

  func create(req: Request) async throws -> Note {
    let note = try req.content.decode(Note.self)
    try await note.save(on: req.db)
    return note
  }

  func update(req: Request) async throws -> Note {
    let updatedNote = try req.content.decode(Note.self)
    guard let note = try await Note.find(
      req.parameters.get("noteID"),
      on: req.db) else {
      throw Abort(.notFound)
    }
    note.body = updatedNote.body
    note.id = updatedNote.id
    note.createdAt = updatedNote.createdAt
    note.coordinates = updatedNote.coordinates
    note.healthData = updatedNote.healthData
    note.localizationName = updatedNote.localizationName
    note.phoneData = updatedNote.phoneData
    note.symbolName = updatedNote.symbolName
    note.temperature = updatedNote.temperature
    note.weather = updatedNote.weather
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
