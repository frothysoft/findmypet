//
//  FakePetsStore.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/19/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

class FakePetsStore: PetsDataAccess {
  var lostPets: Pet[]
  
  init() {
    lostPets = []
    for index in 0..5 { lostPets += fakePet() }
  }
  
  func fakePet() -> Pet {
    var imagePath = NSBundle.mainBundle().resourcePath.stringByAppendingPathComponent("fido.jpg")
    var imageURL = NSURL(fileURLWithPath: imagePath).absoluteString
    return Pet(imageURL: imageURL, name: "Fido", description: "White fur, 80 lbs")
  }
  
  func allPets() -> Pet[]  {
    return lostPets
  }
  
  func storePet(pet: Pet)  {
    // Do nothing
  }
}
