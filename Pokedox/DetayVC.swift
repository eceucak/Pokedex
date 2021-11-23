//
//  DetayVC.swift
//  Pokedox
//
//  Created by Ece Ucak on 21.11.2021.
//

import UIKit
import Kingfisher

class DetayVC: UIViewController {
    
    var poke:PokemonInformation?
    
    @IBOutlet weak var PokeNum: UILabel!
    @IBOutlet weak var PokeName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pokeHeight: UILabel!
    @IBOutlet weak var pokeWeight: UILabel!
    @IBOutlet weak var pokeType: UILabel!
    @IBOutlet weak var pokeWeaknesses: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var weaknessesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = poke {
            
            pokeWeaknesses.text = " "
            pokeType.text = " "
            
            pokeHeight.text = "Height: " + p.height
            pokeWeight.text = "Weight: " + p.weight
            PokeName.text = p.name
            PokeNum.text = p.num
            typeLabel.text = "Type:"
            weaknessesLabel.text = "Weaknesses:"
            
            
            for weakness in p.weaknesses{
                pokeWeaknesses.text =  weakness + " " + pokeWeaknesses.text!
            }
            
            
            for type in p.type{
                pokeType.text =  type + " " + pokeType.text!
            }
            
            if let url = URL(string: p.img){
                imageView.kf.setImage(with:url)
                
            }

     
    }
    

   

}

}
