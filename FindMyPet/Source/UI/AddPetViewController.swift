//
//  AddPetViewController.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/23/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation
import PetKit

class AddPetViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  var userInterface: AddPetRootView! = nil
  var lostPetsAPI: LostPetsAPI!
  
  init(coder aDecoder: NSCoder!) {
    let objectsFactory = (UIApplication.sharedApplication().delegate as AppDelegate).objectsFactory
    lostPetsAPI = objectsFactory.lostPetsAPI
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    UIBarButtonItem.appearance()
    
    userInterface = view as? AddPetRootView
  }
  
  @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func done() {
    if let petData = userInterface.petData() {
      lostPetsAPI.addLostPet(petData) { (error: NSError?) in
        if let e = error {
          var message = "Pet must have an avatar, name, and description."
          var alert = UIAlertController(title: "", message: e.localizedDescription, preferredStyle: .Alert)
          alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
          self.presentViewController(alert, animated: true, completion: nil)
        } else {
          self.dismissViewControllerAnimated(true, completion: nil)
        }
      }
    } else {
      var message = "Pet must have an avatar, name, and description."
      var alert = UIAlertController(title: "", message: message, preferredStyle: .Alert)
      alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
    }
  }
  
  @IBAction func avatarButtonPressed() {
    showPhotoPicker()
  }
  
  @IBAction func addPhotosButtonPressed() {
    println("+ add photos")
  }
  
  func showPhotoPicker() {
    if (!UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum)) { return }
    var mediaPicker = UIImagePickerController()
    mediaPicker.sourceType = .PhotoLibrary
    mediaPicker.allowsEditing = true
    mediaPicker.delegate = self
    presentViewController(mediaPicker, animated: true, completion: nil)
  }
  
  func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
    userInterface.setAvatarImage(image)
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
}