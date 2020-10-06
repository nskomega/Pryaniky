//
//  Data.swift
//  Pryaniky
//
//  Created by Mikhail Danilov on 29.09.2020.
//
import Foundation

// MARK: - PurpleData
struct PurpleData: Codable {
    let data: [Datum]?
    let view: [String]?
    
    func key(key: String) -> Datum? {
        let datum = data?.first(where: { $0.name == key })
        return datum
    }
}

// MARK: - Datum
struct Datum: Codable {
    let name: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
    let coverUrl: String?
    let mediaUrl: String?

    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
        case coverUrl
        case mediaUrl
    }
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int?
    let text: String?
}
