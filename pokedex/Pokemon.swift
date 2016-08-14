//
//  Pokemon.swift
//  pokedex
//
//  Created by fredlin on 2016/8/14.
//  Copyright © 2016年 fredlin. All rights reserved.
//

import Foundation


class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    //getter
    
    var name: String{
        return _name
    }
    
    var pokedexId: Int{
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        _name = name
        _pokedexId = pokedexId
    }
    
}