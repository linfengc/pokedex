//
//  Pokemon.swift
//  pokedex
//
//  Created by Fred Lin on 2016/8/14.
//  Copyright © 2016年 fredlin. All rights reserved.
//

import Foundation


class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    
    //getter
    
    var name: String{
        return _name
    }
    
    var pokedexId: Int{
        return _pokedexId
    }
    
    var weight: String{
        get{ return _weight}
        set{ _weight = weight}
    }
    var height: String{
        get{return _height}
        set{_height = height}
    }
 
    
    init(name: String, pokedexId: Int, weight: String, height: String){
        _name = name
        _pokedexId = pokedexId
        _weight = weight
        _height = height
    }
    
    var type: String{
        get{ return _type}
        set{ _type = type}
    }
    
    
    
    
    
    
    
    
    
}
