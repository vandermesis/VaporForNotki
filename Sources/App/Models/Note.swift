//
//  File.swift
//  
//
//  Created by Marek Skrzelowski on 19/11/2023.
//

import Vapor
import Fluent

final class Note: Model {
    static let schema = "notes"
    
    @ID
    var id: UUID?
    
    @Field(key: "symbol-name")
    var symbolName: String
    
    @Field(key: "body")
    var body: String
    
    @Field(key: "creation-date")
    var creationDate: Date
    
    init() {}
    
    init(
        id: UUID? = nil,
        creationDate: Date = Date(),
        symbolName: String,
        body: String
    ) {
        self.id = id
        self.creationDate = creationDate
        self.symbolName = symbolName
        self.body = body
    }
}

