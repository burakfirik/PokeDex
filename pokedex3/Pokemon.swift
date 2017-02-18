//
//  Pokeman.swift
//  pokedex3
//
//  Created by Burak Firik on 2/16/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
  fileprivate var _name : String!
  fileprivate var _pokedexId: Int!
  private var _description: String!
  private var _type: String!
  private var _defense: String!
  private var _attack: String!
  private var _weight: String!
  private var _height: String!
  private var _nextEvolutionTxt: String!
  
  private var _nextEvolutionName: String!
  private var _nextEvolutionId: String!
  private var _nextEvolutionLevel: String!
  
  
  
  private var _pokemanURL: String!
  
  var nextEvolutionId: String {
    if _nextEvolutionId == nil {
      _nextEvolutionId = ""
    }
    return _nextEvolutionId
  }
  
  var nextEvolutionName: String {
    if _nextEvolutionName == nil {
      _nextEvolutionName = ""
    }
    return _nextEvolutionName
  }
  
  var nextEvolutionLevel: String {
    if _nextEvolutionLevel == nil {
      _nextEvolutionLevel = ""
    }
    return _nextEvolutionLevel
  }
  
  var description: String {
    if _description == nil {
      _description = ""
    }
    return _description
  }
  
  var type: String {
    if _type == nil {
      _type = ""
    }
    return _type
  }
  
  var defense: String {
    if _defense == nil {
      _defense = ""
    }
    return _defense
  }
  
  var height: String {
    if _height == nil {
      _height = ""
    }
    return _height
  }
  var weigth: String {
    if _weight == nil {
      _weight = ""
    }
    return _weight
  }
  
  var attack: String {
    if _attack == nil {
      _attack = ""
    }
    return _attack
  }
  
  var nextEvolutionTxt: String {
    if _nextEvolutionTxt == nil {
      _nextEvolutionTxt = ""
    }
    return _nextEvolutionTxt
  }
  
  var name : String{
    return _name
  }
  
  var pokedexId: Int {
    
    return _pokedexId
  }
  
  init(name: String, pokedexInd: Int) {
    self._name = name
    self._pokedexId = pokedexInd
    
    self._pokemanURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
  }
  
  func downloadPokemonDetail(completed: @escaping DownloadComplete) {
    
    let pokeURL = URL(string: self._pokemanURL)!
    print(self._pokemanURL)
    Alamofire.request(pokeURL).responseJSON { response in
      
      if let dict = response.result.value as? Dictionary<String, AnyObject> {
        if let weight = dict["weight"] as? String {
          self._weight = weight
        }
        if let height = dict["height"] as? String {
          self._height = height
        }
        if let attack = dict["attack"] as? Int {
          self._attack = "\(attack)"
        }
        if let defense = dict["defense"] as? Int {
          self._defense = "\(defense)"
        }
        
        print(self._weight)
        print(self._height)
        print(self._attack)
        print(self._defense)
        
        if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
          if let name = types[0]["name"] {
            self._type = name.capitalized
          }
          
          if types.count > 1 {
            for x in 1 ..< types.count {
              if let name = types[x]["name"] {
                self._type! += "/\(name.capitalized)"
              }
            }
          }
          
        } else {
          self._type = ""
        }
        
        if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
          if let url = descArr[0]["resource_uri"] {
            let DESC_URL = URL(string:  "\(URL_BASE)\(url)")!
            Alamofire.request(DESC_URL).responseJSON { response in
              
              if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                if let descrip = descDict["description"] as? String {
                  self._description  = descrip.replacingOccurrences(of: "POKMON", with: "Pokemon")
                }
              }
              
              
              completed()
            
            }
          
          }
        }
        
        if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
          if let nextEvo = evolutions[0]["to"] as? String {
            if nextEvo.range(of: "mega") == nil {
              self._nextEvolutionName = nextEvo
              
              if let uri = evolutions[0]["resource_uri"] as? String {
                let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon", with:"" )
                self._nextEvolutionId = newStr.replacingOccurrences(of: "/", with: "")
                
                if let lvlExist = evolutions[0]["level"]  {
                  if let level = lvlExist as? Int {
                    self._nextEvolutionLevel = "\(level)"
                  }
                } else {
                  self._nextEvolutionLevel = ""
                }
                
                
              }
              
            }
          }
        }
        
        
      }
      
      completed()
    
    }
  }

}
