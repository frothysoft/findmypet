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
  var avatarImageURL: NSURL
  var name: String
  var description: String
  
  init(pet: Pet) {
    avatarImageURL = NSURL(string: pet.avatarImageURL)
    name = pet.name
    description = pet.description
  }
}