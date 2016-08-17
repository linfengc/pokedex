//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by 廖睦祐 on 2016/8/15.
//  Copyright © 2016年 fredlin. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseattkLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentevoImg: UIImageView!
    @IBOutlet weak var nextevoImg: UIImageView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func backbtnPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
