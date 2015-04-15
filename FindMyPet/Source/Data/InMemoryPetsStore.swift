//
//  InMemoryPetsStore.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/20/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

class InMemoryPetsStore: PetsDataAccess {
  var pets: Array<Pet> = []
  let queue = dispatch_queue_create("PetsStoreQueue", DISPATCH_QUEUE_SERIAL)
  
  func storePet(pet: Pet)  {
    dispatch_sync(queue) { self.pets += pet }
  }
  
  func allPets() -> Array<Pet>  {
    pets.sort(petSorterByDate)
    return pets
  }
  
  func clear() {
    dispatch_sync(queue) { self.pets = [] }
  }
  
  func petSorterByDate (this: Pet, that: Pet) -> Bool {
    return this.createdAt.compare(that.createdAt) == NSComparisonResult.OrderedDescending
  }
}