//
//  Pager.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

struct Pager<T: Codable>: Codable {
    let count: Int?
    let next: String?
    var results = [T]()
}
