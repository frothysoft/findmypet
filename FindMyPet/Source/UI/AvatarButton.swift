//
//  AvatarButton.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/23/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import UIKit

class AvatarButton: UIButton {
  
  var defaultTitle: String! = "add\nphoto"
  
  override func willMoveToSuperview(newSuperview: UIView!) {
    layer.borderColor = UIColor.avatarBorderColor().CGColor
    layer.borderWidth = 1 / UIScreen.mainScreen().scale
    layer.masksToBounds = true
    setTitle(defaultTitle, forState: .Normal)
    titleLabel.numberOfLines = 2
    titleLabel.textAlignment = .Center
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = self.bounds.width / 2
  }
  
  func avatarImage() -> UIImage! {
    return backgroundImageForState(.Normal)
  }
  
  func setAvatarImage(image: UIImage?) {
    if let i = image {
      setBackgroundImage(i, forState: .Normal)
      setTitle(nil, forState: .Normal)
    } else {
      setBackgroundImage(nil, forState: .Normal)
      setTitle("add\nphoto", forState: .Normal)
    }
  }
}
