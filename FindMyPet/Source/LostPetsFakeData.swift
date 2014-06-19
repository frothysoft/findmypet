//
//  LostPetsFakeData.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/19/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

class LostPetsFakeData {
  var lostPets: Pet[]
  
  init() {
    lostPets = []
    for index in 0..5 { lostPets += fakePet() }
  }
  
  func fakePet() -> Pet {
    return Pet(
      imageURL: NSURL(string: "fido.jpg"),
      name: "Fido",
      furColor: "White fur",
      weight: "80 lbs")
  }
}
