//
//  PFObjectToPet.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/20/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

extension Pet {
  init(object: PFObject) {
    let imageFile = object["image"] as PFFile
    let imageURL = imageFile.url
    let name = object["name"] as String
    let description = object["description"] as String
    self = Pet(imageURL: imageURL, name: name, description: description)
  }
}