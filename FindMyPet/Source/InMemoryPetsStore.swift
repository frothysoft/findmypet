//
//  InMemoryPetsStore.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/20/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

class InMemoryPetsStore: PetsDataAccess {
  var pets: Pet[] = []
  let queue = dispatch_queue_create("PetsStoreQueue", DISPATCH_QUEUE_SERIAL)
  
  func storePet(pet: Pet)  {
    dispatch_sync(queue) { self.pets += pet; }
  }
  
  func allPets() -> Pet[]  {
    return pets
  }
}