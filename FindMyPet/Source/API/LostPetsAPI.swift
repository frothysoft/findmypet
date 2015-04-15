//
//  LostPetsAPI.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/20/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

protocol LostPetsAPI {
  
  func getLostPetsWithCompletion(completion: ((error: NSError?) -> () )?)
  func addLostPet(petData: PetData, completion: ((error: NSError?) -> () )?)
  
}
