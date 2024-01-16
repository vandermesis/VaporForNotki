import Leaf
import Vapor

struct WebsiteController: RouteCollection {
  func boot(routes: Vapor.RoutesBuilder) throws {
    routes.get(use: indexHandler)
  }
  
  func indexHandler(_ req: Request) async throws -> View {
    try await req.view.render("index")
  }
}
