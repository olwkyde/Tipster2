//
//  TipViewController.m
//  Tipster2
//
//  Created by Isaac Oluwakuyide on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:true];
}
- (IBAction)updateLabels:(id)sender {
    if (self.billField.text.length == 0)    {
        [self hideLabels];
    } else {[self showLabels];
    }
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercengtage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    NSString *billString = [self.billField.text substringFromIndex:0];
    double bill = [billString doubleValue];
    double tip = bill * tipPercengtage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat: @"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f", total];
    
}

- (void)hideLabels {
    [UIView animateWithDuration:0.3 animations:^{     CGRect billFrame = self.billField.frame;
        self.labelsContainerView.alpha = 0;
}];

}

- (void)showLabels {
    [UIView animateWithDuration:0.3 animations:^{     CGRect billFrame = self.billField.frame;
        
        self.labelsContainerView.alpha = 1;
     }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
