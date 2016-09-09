//
//  Pokemon.swift
//  Pokedex
//
//  Created by Yoanna Mareva on 9/1/16.
//  Copyright © 2016 Yoanna Mareva. All rights reserved.
//

import Foundation

class Pokemon {

    private var _name: String!
    private var _pokedexId : Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _width: String!
    private var _attack: String!
    private var _nextEvoText: String!

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
