//
//  PFObjectToPet.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/20/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

extension Pet {
  init(parseObject: PFObject) {
    let avatarImageFile = parseObject[kParsePetAvatarImageKey] as PFFile
    let avatarImageURL = avatarImageFile.url
    let name = parseObject[kParsePetNameKey] as String
    let description = parseObject[kParsePetDescriptionKey] as String
    let createdAt = parseObject.createdAt
    self = Pet(avatarImageURL: avatarImageURL, name: name, description: description, createdAt: createdAt)
  }
}
