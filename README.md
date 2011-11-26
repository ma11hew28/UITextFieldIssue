UITextFieldIssue
================

This Xcode project demonstrates a `UITextField` issue in iOS 5.0: Calling
`setText:` in `textField:shouldChangeCharactersInRange:replacementString:`
faultily triggers a `UIControlEventEditingChanged` action.

See [`ViewController.m`][1] for the pertinent code.

  [1]: https://github.com/mattdipasquale/UITextFieldIssue/blob/master/UITextFieldIssue/ViewController.m#L32-54
