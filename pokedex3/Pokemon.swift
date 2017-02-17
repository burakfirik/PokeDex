//
//  Pokeman.swift
//  pokedex3
//
//  Created by Burak Firik on 2/16/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import Foundation


class Pokemon {
  fileprivate var _name : String!
  fileprivate var _pokedexId: Int!
  
  
  var name : String{
    return _name
  }
  var pokedexId: Int {
    
    return _pokedexId
  }
  
  init(name: String, pokedexInd: Int) {
    self._name = name
    self._pokedexId = pokedexInd
  }

}
