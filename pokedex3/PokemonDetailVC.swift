//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Burak Firik on 2/17/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
  
  @IBOutlet weak var nameLbl: UILabel!
  
  var pokemon: Pokemon!
  @IBOutlet weak var mainImg: UIImageView!
  @IBOutlet weak var descriptionLbl: UILabel!
  @IBOutlet weak var typeLbl: UILabel!
  @IBOutlet weak var defenseLbl: UILabel!
  @IBOutlet weak var heightLbl: UILabel!
  @IBOutlet weak var pokedexLbl: UILabel!
  @IBOutlet weak var attackLbl: UILabel!
  @IBOutlet weak var weightLbl: UILabel!
  @IBOutlet weak var currentEvoImg: UIImageView!
  @IBOutlet weak var nextEvoImg: UIImageView!
  @IBOutlet weak var evoLbl: UILabel!
  
  @IBAction func backButtonPressed(_ sender: UIButton) {
    
    dismiss(animated: true, completion: nil)
  }
    override func viewDidLoad() {
      
      super.viewDidLoad()
      self.nameLbl.text = pokemon.name.capitalized
      let img = UIImage(named: "\(pokemon.pokedexId)")
      self.mainImg.image = img
      self.pokedexLbl.text = "\(pokemon.pokedexId)"
      self.pokemon.downloadPokemonDetail {
        self.updateUI()
      }
      
    }
  
  func updateUI() {
    self.attackLbl.text = pokemon.attack
    self.defenseLbl.text = pokemon.defense
    self.heightLbl.text = pokemon.height
    self.weightLbl.text = pokemon.weigth
    self.typeLbl.text = pokemon.type
    self.descriptionLbl.text = pokemon.description
    self.currentEvoImg.image = UIImage(named: "\(pokemon.pokedexId)")
    if pokemon.nextEvolutionId == "" {
      self.evoLbl.text = "No Evolutions"
      self.nextEvoImg.isHidden = true
    } else {
      self.evoLbl.text = pokemon.nextEvolutionName
      nextEvoImg.isHidden = false
      nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
      
      let evoString = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
      evoLbl.text = evoString

    }
    
  }


}
