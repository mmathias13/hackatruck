//
//  StrucMapa.swift
//  Aula06UFES
//
//  Created by Turma02-19 on 13/06/24.
//

import Foundation
import MapKit
struct Location: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}
