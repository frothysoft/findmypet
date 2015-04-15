//
//  PetDataToPFObject.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/25/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

extension PFObject {
  convenience init(petData: PetData, avatarImageFile: PFFile) {
    var dictionary = [
      kParsePetNameKey: petData.name,
      kParsePetDescriptionKey: petData.description,
      kParsePetAvatarImageKey: avatarImageFile
    ]
    self.init(className: kParsePetClassKey, dictionary: dictionary)
  }
}