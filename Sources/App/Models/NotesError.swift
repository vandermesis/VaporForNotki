import Foundation
import Vapor

struct NotesError: DebuggableError {
    enum Value {
        case userNotLoggedIn
        case invalidEmail(String)
        case envDataNotFound(String)
    }
    
    var identifier: String {
        switch self.value {
        case .userNotLoggedIn:
            return "userNotLoggedIn"
        case .invalidEmail:
            return "invalidEmail"
        case .envDataNotFound:
            return "envDataNotFound"
        }
    }
    
    var reason: String {
        switch self.value {
        case .userNotLoggedIn:
            return "User is not logged in."
        case .invalidEmail(let email):
            return "Email address is not valid: \(email)."
        case .envDataNotFound(let data):
            return "Environment data not found: \(data)"
        }
    }
    
    var value: Value
    var source: ErrorSource?
    
    init(
        _ value: Value,
        file: String = #file,
        function: String = #function,
        line: UInt = #line,
        column: UInt = #column
    ) {
        self.value = value
        self.source = .init(
            file: file,
            function: function,
            line: line,
            column: column
        )
    }
}
