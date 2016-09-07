//
//  PokeDetailVC.swift
//  pokedex
//
//  Created by Student on 9/6/16.
//  Copyright © 2016 fredlin. All rights reserved.
//

import UIKit

class PokeDetailVC: UIViewController {
    
    
    
    
    
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var heightVal: UILabel!
    @IBOutlet weak var weightVal: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var idNum: UILabel!
    @IBOutlet weak var backButton: NSLayoutConstraint!
    @IBOutlet weak var selectedPokeImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    var pokemon: Pokemon!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView();
        
    }
    
    func setUpView(){
        nameLbl.text = pokemon.name.capitalizedString
        selectedPokeImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        idNum.text = "\(pokemon.pokedexId)"
        //TO DO: parse weight and height and other info
       // weightVal.text = (pokemon.weight)
        //heightVal.text = (pokemon.height)
        
        
        
    }

    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
