//
//  ViewController.swift
//  Pokedox
//
//  Created by Ece Ucak on 21.11.2021.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var PokemonCollectionView: UICollectionView!
    
    
    var pokemonListe2 = [PokemonInformation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
        
        PokemonCollectionView.delegate = self
        PokemonCollectionView.dataSource = self
        
        let urlString = "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                    parse(data)
                    return
            }
        }
       
    }
    
    func parse(_ json:Data){
        let decoder = JSONDecoder()

        if let decodedData = try? decoder.decode(pokemonAPI.self, from: json) {
            pokemonListe2 =  decodedData.pokemon
        }

        for pokemon in pokemonListe2 {
            print("Weight : \(pokemon.weight) , Name : \(pokemon.name)")
        }


    }

}


extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonListe2.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemon = pokemonListe2[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCollectionViewCell", for: indexPath) as! PokeCollectionViewCell
        
        let url = URL(string: pokemon.img)
        
        cell.imageView.kf.setImage(with: url)
        cell.nameLabel.text = pokemon.name
        
        cell.layer.borderColor = UIColor.yellow.cgColor
        cell.layer.borderWidth = 0.75
        cell.layer.cornerRadius = 10

        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = pokemonListe2[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: pokemon)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            let character = sender as? PokemonInformation
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.poke = character     
        }
    }
}
//MARK: Styling
extension ViewController{
    func styling(){
        //ArkaPlan rengi
               self .navigationItem.title = "POKEDEX"
                let apperance = UINavigationBarAppearance()
               apperance.backgroundColor = UIColor.black
               apperance.titleTextAttributes = [.foregroundColor: UIColor.yellow]
               navigationController?.navigationBar.barStyle = .black
               navigationController?.navigationBar.isTranslucent = true
               
               navigationController?.navigationBar.standardAppearance = apperance
               navigationController?.navigationBar.compactAppearance = apperance
               navigationController?.navigationBar.scrollEdgeAppearance = apperance
               
               
               
               let genislik = PokemonCollectionView.frame.size.width
               let tasarim = UICollectionViewFlowLayout()
               tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
               tasarim.minimumInteritemSpacing = 10
               tasarim.minimumLineSpacing = 10
               let itemGenislik = (genislik-45)/3
               tasarim.itemSize = CGSize(width: itemGenislik, height: (itemGenislik*1.28))
               PokemonCollectionView.collectionViewLayout = tasarim
    }
}
