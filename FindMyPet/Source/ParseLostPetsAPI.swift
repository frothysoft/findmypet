//
//  ParseLostPetsAPI.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/20/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

class ParseLostPetsAPI : LostPetsAPI {

  var petsStore: PetsDataAccess
  
  init(petsStore: PetsDataAccess) {
    self.petsStore = petsStore
  }
  
  func getLostPetsWithCompletion(completion: (() -> () )?) {
    var query = PFQuery(className: "Pet")
    query.findObjectsInBackgroundWithBlock({objects, error in
      for object : AnyObject in objects {
        let pet = Pet(object: object as PFObject)
        self.petsStore.storePet(pet)
      }
      if let c = completion { c() }
    })
  }
}