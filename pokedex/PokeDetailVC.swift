//
//  PokeDetailVC.swift
//  pokedex
//
//  Created by Student on 9/6/16.
//  Copyright © 2016 fredlin. All rights reserved.
//

import UIKit

class PokeDetailVC: UIViewController {
    
    
    
    
    
    
    @IBOutlet weak var nameLbl: UILabel!
    var pokemon: Pokemon!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLbl.text = pokemon.name
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
