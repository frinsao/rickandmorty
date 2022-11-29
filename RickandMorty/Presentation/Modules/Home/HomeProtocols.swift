//
//  HomeProtocols.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

protocol HomeBuilderProtocol: BuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeRouterProtocol {

}

protocol HomeViewModelProtocol: ViewModelProtocol {
}
