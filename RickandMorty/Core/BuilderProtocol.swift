//
//  BuilderProtocol.swift
//  RickandMorty
//
//  Created by Jesus on 29/11/22.
//

import Foundation

public protocol BuilderProtocol {
    func build() -> BaseViewController
}

public extension BuilderProtocol {
    func build() -> BaseViewController { BaseViewController() }
}
