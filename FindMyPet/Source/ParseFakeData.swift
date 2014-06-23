//
//  ParseFakeData.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/20/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

class ParseFakeData {
  func clearDatabaseAndAddFakeObjects() {
    clearDatabase({ () in
      self.addFakeObjects()
    })
  }
  
  func clearDatabase(completionClosure: ()->()) {
    let allObjectsQuery = PFQuery(className: "Pet")
    allObjectsQuery.findObjectsInBackgroundWithBlock({objects, error in
      for object: AnyObject in objects {
        object.delete()
      }
      completionClosure()
    })
  }
  
  func addFakeObjects() {
    addFakePet(Pet(imageURL: "fido.jpg", name:"Fido", description:"White fur, 80 lbs"))
    addFakePet(Pet(imageURL: "trix.jpg", name:"Trix", description:"Orange fur, 15 lbs"))
    addFakePet(Pet(imageURL: "saxophone.jpg", name:"Saxophone", description:"Green, 28 lbs"))
    addFakePet(Pet(imageURL: "giraffe.jpg", name:"Giraffe", description:"White fur, 24 lbs"))
    addFakePet(Pet(imageURL: "hissy.jpg", name:"Hissy", description:"Brown with black streaks, 18 lbs"))
  }
  
  func addFakePet(pet: Pet) {
    var imageData = UIImageJPEGRepresentation(UIImage(named: pet.imageURL), 0.5)
    var imageFile = PFFile(name: pet.imageURL, data: imageData)
    imageFile.saveInBackgroundWithBlock({succeeded, error in
      var petObject = PFObject(className: "Pet")
      petObject.setValue(pet.name, forKey: "name")
      petObject.setValue(pet.description, forKey: "description")
      petObject.setValue(imageFile, forKey: "image")
      petObject.saveInBackground()
    })
  }
}
