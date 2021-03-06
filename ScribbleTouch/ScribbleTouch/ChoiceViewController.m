//
//  ChoiceViewController.m
//  ScribbleTouch
//
//  Created by Jide Opeola on 1/16/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ChoiceViewController.h"

//shape type scribble line rectangle, triangle and ellipse

@interface ChoiceViewController () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UIView *backgroundView;



@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.backgroundView.alpha = 0;
    
    
//    
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [UIView animateWithDuration:0.1 animations:^{
    
        self.backgroundView.alpha = 0.1;}];

}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.choices.count;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.choices[row];
    
    
}



- (IBAction)dissmiss:(id)sender {
    
    NSString * choice = self.choices[[self.pickerView selectedRowInComponent:0]];
    
    [self.delegate choice:choice forGroupp:self.group];
    

    
    
    [UIView animateWithDuration:0.4 animations:^{ self.backgroundView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [self dismissViewControllerAnimated:NO completion:nil];
        
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
