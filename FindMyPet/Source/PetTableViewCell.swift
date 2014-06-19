//
//  PetTableViewCell.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/19/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
  
  @IBOutlet var petImageView: UIImageView
  @IBOutlet var petNameLabel: UILabel
  @IBOutlet var petInfoLabel: UILabel
  
  init() {
    super.init(style: .Default, reuseIdentifier: "PetTableViewCell")
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    self.petImageView.clipsToBounds = true
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
  
  override func layoutSubviews()  {
    super.layoutSubviews()
    self.petImageView.layer.cornerRadius = self.petImageView.bounds.size.width / 2
  }
}
