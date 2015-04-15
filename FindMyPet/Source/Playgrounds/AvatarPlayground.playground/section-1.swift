// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class AvatarButton: UIButton {
  
  init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.borderColor = UIColor.lightGrayColor().CGColor
    self.layer.borderWidth = 1 / UIScreen.mainScreen().scale
    self.setTitle("add\nphoto", forState: .Normal)
    self.titleLabel.numberOfLines = 2
    self.titleLabel.textAlignment = .Center
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = self.bounds.width / 2
  }
}

var button = AvatarButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))