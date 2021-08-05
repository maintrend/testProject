//
//  Welcome.swift
//  testProject
//
//  Created by talgat on 7/28/21.
//

import Foundation

struct Welcome: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

