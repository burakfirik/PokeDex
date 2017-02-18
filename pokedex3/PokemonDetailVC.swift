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
  @IBOutlet weak var pokedecLbl: UILabel!
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
        self.nameLbl.text = pokemon.name
        // Do any additional setup after loading the view.
    }


}
