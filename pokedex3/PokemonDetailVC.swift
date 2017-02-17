//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Burak Firik on 2/17/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
   var pokemon: Pokemon!
  
  @IBOutlet weak var pokemonLabel: UILabel!

  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonLabel.text = pokemon.name
        // Do any additional setup after loading the view.
    }


}
