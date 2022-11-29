//
//  Pager.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

struct Pager<T: Codable>: Codable {
    var info: PagerInfo
    var results = [T]()
}

struct PagerInfo: Codable {
    var count: Int
    var next: String?
}
