//
//  DetailPokemonVC.swift
//  Pokedex
//
//  Created by Yoanna Mareva on 9/9/16.
//  Copyright © 2016 Yoanna Mareva. All rights reserved.
//

import UIKit

class DetailPokemonVC: UIViewController {

    var pokemon : Pokemon!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenceLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UIStackView!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLabel.text = pokemon.name
    }

    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
