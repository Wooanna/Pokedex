//
//  Pokemon.swift
//  Pokedex
//
//  Created by Yoanna Mareva on 9/1/16.
//  Copyright © 2016 Yoanna Mareva. All rights reserved.
//

import Foundation

class Pokemon {

    fileprivate var _name: String!
    fileprivate var _pokedexId : Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._pokedexId = pokedexId
        self._name = name
    }
}
