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
  
  func getLostPetsWithCompletion(completion: ((error: NSError?) -> () )?) {
    var query = PFQuery(className: kParsePetClassKey)
    query.orderByDescending(kParsePetCreatedAtKey)
    query.findObjectsInBackgroundWithBlock() { (objects, error) in
      // TODO: Store only unique pets instead of clearing the store.
      self.petsStore.clear()
      for object : AnyObject in objects {
        var parseObject = object as PFObject
        let pet = Pet(parseObject: parseObject)
        self.petsStore.storePet(pet)
      }
      if let c = completion { c(error: nil) }
    }
  }
  
  func addLostPet(petData: PetData, completion: ((error: NSError?) -> () )?) {
    var imageData = UIImageJPEGRepresentation(petData.avatarImage, 0.5)
    var avatarImageFile = PFFile(name: "avatar.jpg", data: imageData)
    avatarImageFile.saveInBackgroundWithBlock() { (succeeded, error) in
      if succeeded {
        var petObject = PFObject(petData: petData, avatarImageFile: avatarImageFile)
        petObject.saveInBackgroundWithBlock { (success, error) in
          if let c = completion { c(error: nil) }
        }
      } else {
        if let c = completion { c(error: error) }
      }
    }
  }
}