#import "ViewController.h"

@interface ViewController ()
- (void)textFieldDidChange:(UITextField *)textField;
@end

@implementation ViewController

@synthesize sampleTextField;

#pragma mark - UIViewController

- (void)viewDidUnload {
    self.sampleTextField = nil;
    [super viewDidUnload];
}

- (void)viewDidLoad {
    sampleTextField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 100.0f, 44.0f)];
    sampleTextField.delegate = self;
    [sampleTextField addTarget:self action:@selector(textFieldDidChange:)
              forControlEvents:UIControlEventEditingChanged];
    sampleTextField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:sampleTextField];
    [sampleTextField becomeFirstResponder];

    sampleTextField.text = @"b"; // setting text here doesn't trigger textFieldDidChange:

    [super viewDidLoad];
}

// The code below should make it so that if sampleTextField.text matches "b", then whatever I type
// next should replace "b". Instead, it's appended to "b" because calling setText: in
// textField:shouldChangeCharactersInRange:replacementString: faultily triggers textFieldDidChange:.

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    if ([sampleTextField.text isEqualToString:@"b"]) {
        if ([string length]) {          // inserting
            sampleTextField.text = @""; // setting text here triggers textFieldDidChange:
        }
    }
    return YES;
}

#pragma mark - UIControlEventEditingChanged

- (void)textFieldDidChange:(UITextField *)textField {
    if (![sampleTextField hasText]) {
        sampleTextField.text = @"b";
    }
}

@end
