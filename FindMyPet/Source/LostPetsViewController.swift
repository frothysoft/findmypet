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
  
  init(coder aDecoder: NSCoder!) {
    lostPets = FakeLostPetsAPI().allLostPets()
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTableView()
  }
  
  func setUpTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 130
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return lostPets.count
  }
  
  override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!  {
    let id = "PetTableViewCell"
    var cell = tableView.dequeueReusableCellWithIdentifier(id) as? PetTableViewCell
    if !cell {
      cell = PetTableViewCell()
    }
    
    let pet = lostPets[indexPath.item]
    let displayablePet = DisplayablePet(pet: pet)
    if let c = cell {
      c.petImageView.image = displayablePet.image
      c.petNameLabel.text = displayablePet.name
      c.petInfoLabel.text = displayablePet.details
    }
    
    return cell
  }
  
  override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}

