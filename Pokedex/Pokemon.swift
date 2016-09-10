//
//  Pokemon.swift
//  Pokedex
//
//  Created by Yoanna Mareva on 9/1/16.
//  Copyright © 2016 Yoanna Mareva. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {

    private var _name: String!
    private var _pokedexId : Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoText: String!
    private var _pokemonURL : String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var nextEvoText: String {
        if _nextEvoText == nil {
            _nextEvoText = ""
        }
            return _nextEvoText
    }
    
    var attack : String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var weight :String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var height :String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var defense :String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var type :String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var description :String {
        if _description == nil {
            _description = ""
        }
        return _description
    }

    init(name: String, pokedexId: Int) {
        self._pokedexId = pokedexId
        self._name = name
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        Alamofire.request(_pokemonURL, withMethod: .get).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }

                if let attack = dict["attack"] as? Int {
                    self._attack = attack.description
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = defense.description
                }
                
                if let types = dict["types"] as? Array<Dictionary<String, String>>, types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for t in 1..<types.count {
                            if let name = types[t]["name"] {
                            self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                if let descArr = dict["descriptions"] as? Array<Dictionary<String, String>>, descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        let descUrl = "\(URL_BASE)\(url)"
                        Alamofire.request(descUrl, withMethod: .get).responseJSON(completionHandler: { (response) in
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                }
                            }
                            completed()
                        })
                    }
                } else {
                    self._description = ""
                }
            }
            
            completed()
        }
    }
}
