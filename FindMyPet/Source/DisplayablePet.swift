//
//  DisplayablePet.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/19/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation
import UIKit

struct DisplayablePet {
  var imageURL: NSURL
  var name: String
  var description: String
  
  init(pet: Pet) {
    imageURL = NSURL(string: pet.imageURL)
    name = pet.name
    description = pet.description
  }
}