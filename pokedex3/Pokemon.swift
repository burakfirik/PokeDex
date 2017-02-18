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
  private var _description: String!
  private var _type: String!
  private var _defense: String!
  private var _attack: String!
  private var _pokedex: String!
  private var _weight: String!
  private var _height: String!
  private var _nextEvolutionTxt: String!
  
  
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
