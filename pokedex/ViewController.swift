//
//  ViewController.swift
//  pokedex
//
//  Created by 廖睦祐 on 2016/8/14.
//  Copyright © 2016年 fredlin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    //pokemon array for parsing
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        parsePokemonCSV()
        initAudio()
    }
    
    func initAudio(){
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do{
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        }catch let err as NSError{
            print(debugDescription)
        }
    }
    
    func parsePokemonCSV(){
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do{
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)! //row is dicitionary and convert it to int
                let name = row["identifier"]!
                let poke_i = Pokemon(name: name, pokedexId: pokeId)
                
                pokemon.append(poke_i)
                
                
                
            }
            
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            let poke: Pokemon!
            if inSearchMode{
                poke = filteredPokemon[indexPath.row]
            }
            else{
                poke = pokemon[indexPath.row]
            }
            
            cell.configureCell(poke)
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    
    //when selection the cell
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let poke: Pokemon!
        
        if inSearchMode{
            poke = filteredPokemon[indexPath.row]
        }
        
        else{
            poke = pokemon[indexPath.row]
        }
        
        //detailVC<#T##AnyObject?#>
        performSegueWithIdentifier("PokemonDetailVC", sender: poke)
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode{
            return filteredPokemon.count
        }
        
        return pokemon.count
    }
    
    
    
    

    
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105) //Here the size is static but CGSizeMake can be used dynamically
    }
    
    
    @IBAction func musicBtnPressed(sender: UIButton) {
        if musicPlayer.playing{
            musicPlayer.stop()
            sender.alpha = 0.2
        }
        else{
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
  
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            inSearchMode = false
            view.endEditing(true) //force to end after empty
            collection.reloadData()
        }
        else{
            inSearchMode = true
            // data is all lowercase
            let lower = searchBar.text!.lowercaseString
            //$0 is grabbing an element in that array
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil})
            collection.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PokemonDetailVC"{
            if let detailsVC = segue.destinationViewController as? PokemonDetailVC{
                if let poke = sender as? Pokemon{
                    //pokemon clicked(aka sender)
                    detailsVC.pokemon = poke
                }
            }
        }
    }
   



}

