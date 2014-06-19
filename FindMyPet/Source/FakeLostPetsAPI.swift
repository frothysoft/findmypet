//
//  FakeLostPetsAPI.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/19/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

class FakeLostPetsAPI {
  
  func allLostPets() -> Pet[] {
    return LostPetsFakeData().lostPets
  }
}