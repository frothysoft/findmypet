//
//  ViewController.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/19/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import UIKit

class LostPetsViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
  
  var lostPets: Pet[]
  let lostPetsAPI: LostPetsAPI
  let petsStore: PetsDataAccess
  
  init(coder aDecoder: NSCoder!) {
    lostPets = []
    let objectsFactory = (UIApplication.sharedApplication().delegate as AppDelegate).objectsFactory
    lostPetsAPI = objectsFactory.lostPetsAPI
    petsStore = objectsFactory.petsStore
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTableView()
    loadLostPets()
  }
  
  func setUpTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 130
  }
  
  func loadLostPets() {
    lostPetsAPI.getLostPetsWithCompletion({ () in
      self.lostPets = self.petsStore.allPets()
      self.tableView.reloadData()
    })
  }

  override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return lostPets.count
  }
  
  override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!  {
    let id = "PetTableViewCell"
    var cell = tableView.dequeueReusableCellWithIdentifier(id) as? PetTableViewCell
    if !cell { cell = PetTableViewCell() }
    
    let pet = lostPets[indexPath.item]
    let displayablePet = DisplayablePet(pet: pet)
    cell!.displayPet(displayablePet)
    
    return cell
  }
  
  override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}

