//
//  ObjectsFactory.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/20/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

protocol ObjectsFactory {
  
  var petsStore: PetsDataAccess { get }
  var lostPetsAPI: LostPetsAPI { get }
  
}

class PetsObjectFactory: ObjectsFactory {
  
  let petsStore: PetsDataAccess
  let lostPetsAPI: LostPetsAPI
  
  init() {
    petsStore = InMemoryPetsStore()
    lostPetsAPI = ParseLostPetsAPI(petsStore: petsStore)
  }
  
}