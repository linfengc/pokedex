//
//  ViewController.swift
//  pokedex
//
//  Created by 廖睦祐 on 2016/8/14.
//  Copyright © 2016年 fredlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    //pokemon array for parsing
    var pokemon = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collection.delegate = self
        collection.dataSource = self
        parsePokemonCSV()
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
            
        
            let poke = pokemon[indexPath.row]
            
            cell.configureCell(poke)
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    
    //when selection the cell
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    
    
    
    
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105) //Here the size is static but CGSizeMake can be used dynamically
    }

}

