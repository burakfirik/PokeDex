//
//  PokeCell.swift
//  pokedex3
//
//  Created by Burak Firik on 2/16/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
  @IBOutlet weak var thumbImg: UIImageView!
  @IBOutlet weak var nameLbl: UILabel!
  
  var pokemon: Pokemon!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    layer.cornerRadius = 5.0
    
  }
  
  
  func configureCell(_ pokemon: Pokemon) {
    self.pokemon = pokemon
    nameLbl.text = pokemon.name
    thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
  }
}
