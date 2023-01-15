//
//  Heroe.swift
//  Proyecto
//
//  Created by Alex Riquelme on 04-01-23.
//

import Foundation

//Estructura para traer los campos de Heroe de la API

struct Heroe: Codable {
    let id: String
    let name:String
    let photo: String
    let description: String
    let favorite: Bool
}
