//
//  Pokemon.swift
//  Pokedox
//
//  Created by Ece Ucak on 21.11.2021.
//

import Foundation




struct PokemonInformation: Codable {
    var num:String
    var name:String
    var img:String
    var type:Array<String>
    var height:String
    var weight:String
    var weaknesses:Array<String>
    
}


struct pokemonAPI:Codable{
    var pokemon:Array<PokemonInformation>
}


