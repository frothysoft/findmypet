//
//  AddPetRootView.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/24/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

protocol AddPetUserInterface {
  
  func setAvatarImage(image: UIImage)
  func petData() -> PetData
  
}

class DividerView: UIView {
  
  override func willMoveToSuperview(newSuperview: UIView!) {
    super.willMoveToSuperview(newSuperview)
    backgroundColor = UIColor.dividerColor()
  }
  
}

class AddPetRootView: UIView, UITextViewDelegate {
 
  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var contentView: UIView!
  @IBOutlet var avatarButton: AvatarButton!
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var descriptionTextView: UITextView!
  @IBOutlet var phoneTextField: UITextField!
  @IBOutlet var emailTextField: UITextField!
  var originalContentInsets: UIEdgeInsets! = UIEdgeInsetsZero
  var descriptionPlaceholder: String! = nil
  
  override func awakeFromNib() {
    super.awakeFromNib()
    addDividerToView(nameTextField)
    addDividerToView(descriptionTextView)
    addDividerToView(phoneTextField)
    addDividerToView(emailTextField)
  }
  
  func addDividerToView(view: UIView) {
    var dividerView = DividerView()
    addSubview(dividerView)
    dividerView.constrainTopSpaceToView(view, predicate: "10")
    dividerView.constrainHeight("\(1 / UIScreen.mainScreen().scale)")
    dividerView.alignTrailingEdgeWithView(contentView, predicate: "0")
    dividerView.alignLeadingEdgeWithView(view, predicate: "0")
  }
  
  override func willMoveToSuperview(newSuperview: UIView!) {
    super.willMoveToSuperview(newSuperview)
    descriptionPlaceholder = descriptionTextView.text
    descriptionTextView.textContainerInset = UIEdgeInsetsZero
    descriptionTextView.textColor = UIColor.placeholderTextColor()
    originalContentInsets = scrollView.contentInset
    setUpKeyboardNotifications()
  }
  
  func setAvatarImage(image: UIImage) {
    avatarButton.setAvatarImage(image)
  }
  
  func petData() -> PetData? {
    let avatarImage = avatarButton.avatarImage()
    let name = nameTextField.text
    let description = descriptionTextView.text
    if avatarImage != nil && name != nil && description != nil {
      return PetData(avatarImage: avatarImage, name: name, description: description)
    } else {
      return nil
    }
  }
  
  func setUpKeyboardNotifications() {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardDidShow:"), name: UIKeyboardDidShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
  }
  
  func keyboardDidShow(notification: NSNotification) {
    let keyboardFrame = notification.userInfo[UIKeyboardFrameEndUserInfoKey].CGRectValue()
    scrollView.contentInset.bottom = originalContentInsets.bottom + keyboardFrame.height
  }
  
  func keyboardWillHide(notification: NSNotification) {
    let keyboardFrame = notification.userInfo[UIKeyboardFrameEndUserInfoKey].CGRectValue()
    scrollView.contentInset = originalContentInsets
  }
  
  func textViewShouldBeginEditing(textView: UITextView!) -> Bool {
    if (textView.text == descriptionPlaceholder) {
      textView.text = ""
      textView.textColor = UIColor.blackColor()
    }
    return true
  }
  
  func textViewDidEndEditing(textView: UITextView!) {
    if (textView.text == "") {
      textView.text = descriptionPlaceholder
      textView.textColor = UIColor.placeholderTextColor()
    }
  }
}