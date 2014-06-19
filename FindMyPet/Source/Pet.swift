//
//  Pet.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/19/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation
import UIKit

struct DisplayablePet {
  var image: UIImage
  var name: String
  var details: String
  
  init(pet: Pet) {
    image = UIImage(named: pet.imageURL.absoluteString)
    name = pet.name
    details = pet.furColor + ", " + pet.weight
  }
}

struct Pet {
  var imageURL: NSURL
  var name: String
  var furColor: String
  var weight: String
}