//
//  ViewController.m
//  ScribbleTouch
//
//  Created by Jide Opeola on 1/16/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"
#import "ChoiceViewController.h"
#import "CircleButton.h"
#import "CustomSlider.h"

///triangle, ellipse, connect fill color

@interface ViewController () <ChoiceViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *blendModeButton;

@property (weak, nonatomic) IBOutlet UIButton *shapeTypeButton;

@property (weak, nonatomic) IBOutlet UIButton *toggleButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *drawerLeftConstraint;

@property (weak, nonatomic) IBOutlet CircleButton *blackButton;

@property (weak, nonatomic) IBOutlet CircleButton *whiteButton;

@property (weak, nonatomic) IBOutlet CircleButton *blueButton;

@property (weak, nonatomic) IBOutlet CircleButton *yellowButton;

@property (weak, nonatomic) IBOutlet CircleButton *aquaButton;

@property (weak, nonatomic) IBOutlet CircleButton *redButton;
@property (weak, nonatomic) IBOutlet UISlider *sliderPosition;

@property (weak, nonatomic) IBOutlet CircleButton *redFill;

@property (weak, nonatomic) IBOutlet CircleButton *greenFill;
@property (weak, nonatomic) IBOutlet CircleButton *yellowFill;

@property (weak, nonatomic) IBOutlet CircleButton *blueFill;
@property (weak, nonatomic) IBOutlet CircleButton *whiteFill;
@property (weak, nonatomic) IBOutlet CircleButton *blackFill;



@end


@implementation ViewController
{
    NSMutableDictionary * currentScribble;
  //  NSMutableDictionary * currentSlider;
    UIColor * selectedstrokeColor;
    int selectedStrokeWidth;
    int selectedStrokeAlpha;
    UIColor * selectedFillColor;
    
    float shapeAlpha;
    
    NSString * selectedBlendMode;
    NSString * selectedShapeType;

    
//    float widthSliderValue;
//    
//    float alphaSliderValue;
    
//    UIImageView *arrowImgVw;
//    UIImageView *lineImage;
//    UIImageView *ellipseImage;
//    UIImageView *rectangleImage;
//    UIImageView *triangleImage;
    
    

    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    selectedFillColor  = [UIColor clearColor];
    selectedstrokeColor = [UIColor blackColor];
    selectedStrokeWidth = 1;
    selectedStrokeAlpha = 1;
    selectedBlendMode = @"Normal";
    selectedShapeType = @"Scribble";
    
    shapeAlpha = 1;
    
    
    
    
//    [[_blendModeButton layer] setBorderWidth:1.5f];
//    
//    
//     [[_shapeTypeButton layer] setBorderWidth:1.5f];
    
    
    
 //   _shapeTypeButton.alpha = 1;
    
 //   _blendModeButton.alpha = 1;
//    
//    CGRect frame = sender.frame;
//    frame.origin.x = 262; // new x coordinate
//    frame.origin.y = 562; // new y coordinate
//    sender.frame = frame;
//    
//    
//    sender.transform = CGAffineTransformMakeRotation((0.0174)*0);
    
    //      [self.view addSubview:sender];
    
    self.drawerLeftConstraint.constant = -266;
    
    _blackButton.hidden = YES;
    
    _redButton.alpha = 1;
    
    _aquaButton.alpha = 0.3;
    
    _yellowButton.alpha = 0.3;
    
    _blueButton.alpha = 0.3;
    
    _whiteButton.alpha = 0.3;
    
    _blackButton.alpha = 0.3;
    
    
    _blackFill.hidden = YES;
    
    _redFill.alpha = 1;
    
    _greenFill.alpha = 0.3;
    
    _yellowFill.alpha = 0.3;
    
    _blueFill.alpha = 0.3;
    
    _whiteFill.alpha = 0.3;
    
    _blackFill.alpha = 0.3;
    
//        CustomSlider * view = [[CustomSlider alloc]initWithFrame:CGRectMake(7,246,236,30)];
//        view.backgroundColor = [UIColor clearColor];
//        [self.view addSubview:view];
    

//    arrowImgVw = [[UIImageView alloc] initWithFrame:CGRectMake(10,452,32,17)]; //just example change the frame as per your need
//    
//    arrowImgVw.image = [UIImage imageNamed:@"write22.png"];
//     [self.view addSubview:arrowImgVw];
    
    ScribbleView * screw = [[ScribbleView alloc]init];
    
    screw.layer.cornerRadius = 100;
    
    screw.layer.masksToBounds = YES;
    
    //  self.layer.cornerRadius = self.cornerSize;
    
    //  self.layer.masksToBounds = YES;

}


- (IBAction)changeFillColor:(UIButton *)sender {
    
    selectedFillColor = sender.backgroundColor;

    sender.alpha = 1;
    
    if (_redFill.state == 1) {
        _greenFill.alpha = 0.3;
        _yellowFill.alpha = 0.3;
        _blueFill.alpha = 0.3;
        _whiteFill.alpha = 0.3;
        _blackFill.alpha = 0.3;
    } else if (_greenFill.state == 1) {
        _redFill.alpha = 0.3;
        _yellowFill.alpha = 0.3;
        _blueFill.alpha = 0.3;
        _whiteFill.alpha = 0.3;
        _blackFill.alpha = 0.3;
    } else if (_yellowFill.state == 1) {
        _redFill.alpha = 0.3;
        _greenFill.alpha = 0.3;
        _blueFill.alpha = 0.3;
        _whiteFill.alpha = 0.3;
        _blackFill.alpha = 0.3;
    } else if (_blueFill.state == 1) {
        _redFill.alpha = 0.3;
        _greenFill.alpha = 0.3;
        _yellowFill.alpha = 0.3;
        _whiteFill.alpha = 0.3;
        _blackFill.alpha = 0.3;
    } else if (_whiteFill.state == 1) {
        _redFill.alpha = 0.3;
        _greenFill.alpha = 0.3;
        _yellowFill.alpha = 0.3;
        _blueFill.alpha = 0.3;
        _blackFill.alpha = 0.3;
    } else if (_blackFill.state == 1) {
        _redFill.alpha = 0.3;
        _greenFill.alpha = 0.3;
        _yellowFill.alpha = 0.3;
        _blueFill.alpha = 0.3;
        _whiteFill.alpha = 0.3;
    } else {
        
            _blackFill.alpha = 0.3;
            _redFill.alpha = 0.3;
            _greenFill.alpha = 0.3;
            _yellowFill.alpha = 0.3;
            _blueFill.alpha = 0.3;
            _whiteFill.alpha = 0.3;

        
    }
    
    
    
    
    
    
}



- (IBAction)changeStrokeColor:(UIButton *)sender {
    
    
    selectedstrokeColor = sender.backgroundColor;
    
    
    sender.alpha = 1;
    
    if (_redButton.state == 1) {
        _aquaButton.alpha = 0.3;
        _yellowButton.alpha = 0.3;
        _blueButton.alpha = 0.3;
        _whiteButton.alpha = 0.3;
        _blackButton.alpha = 0.3;
    }
    
    if (_aquaButton.state == 1) {
        _redButton.alpha = 0.3;
        _yellowButton.alpha = 0.3;
        _blueButton.alpha = 0.3;
        _whiteButton.alpha = 0.3;
        _blackButton.alpha = 0.3;
    }
    
    if (_yellowButton.state == 1) {
        _redButton.alpha = 0.3;
        _aquaButton.alpha = 0.3;
        _blueButton.alpha = 0.3;
        _whiteButton.alpha = 0.3;
        _blackButton.alpha = 0.3;
    }
    
    if (_blueButton.state == 1) {
        _redButton.alpha = 0.3;
        _aquaButton.alpha = 0.3;
        _yellowButton.alpha = 0.3;
        _whiteButton.alpha = 0.3;
        _blackButton.alpha = 0.3;
    }
    
    if (_whiteButton.state == 1) {
        _redButton.alpha = 0.3;
        _aquaButton.alpha = 0.3;
        _yellowButton.alpha = 0.3;
        _blueButton.alpha = 0.3;
        _blackButton.alpha = 0.3;
    }
    
    if (_blackButton.state == 1) {
        _redButton.alpha = 0.3;
        _aquaButton.alpha = 0.3;
        _yellowButton.alpha = 0.3;
        _blueButton.alpha = 0.3;
        _whiteButton.alpha = 0.3;
    }
    
    
    
    
    
}


//- (IBAction)widthOrAlpha:(UISegmentedControl *)sender {
//    
//    
//  
//        widthSliderValue = _changeWidthAlpha.value;
//        
//        alphaSliderValue = _changeWidthAlpha.value;
//        
//        if (sender.selectedSegmentIndex == 0) {
//            
//            
//            
//            NSLog(@"slider value %f", widthSliderValue);
//            
//            selectedStrokeWidth = widthSliderValue;
//            
//            [_changeWidthAlpha setValue:widthSliderValue animated:YES];
//            
//            
//            
//            
//            
//        } else {
//            
//            
//            
//            [_changeWidthAlpha setValue:alphaSliderValue animated:YES];
//            
//            selectedStrokeAlpha = alphaSliderValue;
//            
//            
//            
//        
//        
//        
//    }
//
//
//
//}
- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
            selectedStrokeWidth = sender.value;
    
        
  
}

- (IBAction)changeStrokeAlpha:(UISlider *)sender {
    
    selectedStrokeAlpha = sender.value;
    
    NSLog(@"%d", selectedStrokeAlpha);
    
}

//- (IBAction)changeStrokeWidth:(UISlider *)sender {
//    
//        sender.
//        
//        selectedStrokeWidth = sender.value;
//        
//  
//    
// 
//
//        selectedStrokeAlpha = sender.value;
//   
//}
- (IBAction)undoArray:(UIButton *)sender {
    
    [currentScribble removeAllObjects];
    
    [self.view setNeedsDisplay];
    
}
- (IBAction)clearArray:(UIButton *)sender {
    
    ScribbleView * sView = (ScribbleView *)self.view;
    [sView.scribbles removeAllObjects];
    
    [self.view setNeedsDisplay];
}




-(void)choice:(NSString *)choice forGroupp:(NSString *)group { /////////////
    
    if ([group isEqualToString:@"BlendMode"]) {
        
        selectedBlendMode = choice;
        [self.blendModeButton setTitle:choice forState:UIControlStateNormal];
        
    }
    
    if ([group isEqualToString:@"ShapeType"]) {
        
        selectedShapeType = choice;
        [self.shapeTypeButton setTitle:choice forState:UIControlStateNormal];
        
//        if ([choice  isEqual: @"Scribble"]) {
//            
////            NSLog(@"%@",choice);
////            
////            arrowImgVw = [[UIImageView alloc] initWithFrame:CGRectMake(262,452,32,17)]; //just example change the frame as per your need
////            
////            arrowImgVw.image = [UIImage imageNamed:@"write22.png"];
////             lineImage.image = [UIImage imageNamed:@""];
////             ellipseImage.image = [UIImage imageNamed:@""];
////            rectangleImage.image = [UIImage imageNamed:@""];
////            triangleImage.image = [UIImage imageNamed:@""];
////            
////            
////            [self.view addSubview:arrowImgVw];
//        }
//        
//        if ([choice  isEqual: @"Line"]) {
//            
////            NSLog(@"%@",choice);
////            
////            lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(258,445,40,40)]; //just example change the frame as per your need
////            
////            lineImage.image = [UIImage imageNamed:@"shape_line.png"];
////            
////            arrowImgVw.image = [UIImage imageNamed:@""];
////            ellipseImage.image = [UIImage imageNamed:@""];
////            rectangleImage.image = [UIImage imageNamed:@""];
////            triangleImage.image = [UIImage imageNamed:@""];
////            
////            [self.view addSubview:lineImage];
//            
//            
//        }
//
//        if ([choice  isEqual: @"Ellipse"]) {
//            
////            NSLog(@"%@",choice);
////            
////            ellipseImage = [[UIImageView alloc] initWithFrame:CGRectMake(258,442,42,42)]; //just example change the frame as per your need
////            
////            ellipseImage.image = [UIImage imageNamed:@"shape_ellipse.png"];
////            arrowImgVw.image = [UIImage imageNamed:@""];
////            lineImage.image = [UIImage imageNamed:@""];
////            rectangleImage.image = [UIImage imageNamed:@""];
////            triangleImage.image = [UIImage imageNamed:@""];
////            
////            [self.view addSubview:ellipseImage];
//        }
//        
//        if ([choice  isEqual: @"Rectangle"]) {
//            
////            NSLog(@"%@",choice);
////            
////            rectangleImage = [[UIImageView alloc] initWithFrame:CGRectMake(258,445,40,40)]; //just example change the frame as per your need
////            
////            rectangleImage.image = [UIImage imageNamed:@"shape_rectangle.png"];
////            
////            arrowImgVw.image = [UIImage imageNamed:@""];
////            lineImage.image = [UIImage imageNamed:@""];
////            ellipseImage.image = [UIImage imageNamed:@""];
////            triangleImage.image = [UIImage imageNamed:@""];
////            
////            [self.view addSubview:rectangleImage];
//        }
//        
//        if ([choice  isEqual: @"Triangle"]) {
//            
////            NSLog(@"%@",choice);
////            
////            triangleImage = [[UIImageView alloc] initWithFrame:CGRectMake(258,445,40,40)]; //just example change the frame as per your need
////            
////            triangleImage.image = [UIImage imageNamed:@"shape_triangle.png"];
////            arrowImgVw.image = [UIImage imageNamed:@""];
////            lineImage.image = [UIImage imageNamed:@""];
////            ellipseImage.image = [UIImage imageNamed:@""];
////            rectangleImage.image = [UIImage imageNamed:@""];
////            
////            [self.view addSubview:triangleImage];
//        }
//        
        
        
        
    }
    
   // NSLog(@"Choice = %@ for Group %@",choice,group);
}

- (IBAction)changeBlendMode:(id)sender {
    
    // grabs storyboard..same @"choiceVC" as in storyboard id
    
    ChoiceViewController * choiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"choiceVC"];
    
    choiceVC.delegate = self;
    choiceVC.group = @"BlendMode";
    choiceVC.choices = @[
                         @"Normal",
                         @"Multiply",
                         @"Overlay",
                         @"Screen",
                         @"Clear"
                         ];
    [self presentViewController:choiceVC animated:NO completion:nil];
    
    
}

//- (IBAction)chooseSegment:(UISegmentedControl *)sender {
//    
//    
//    if (sender.selectedSegmentIndex ==0) {
//        
//        fillornah = NO;
//        
//    }else{
//        
//        fillornah = YES;
//        
//    }
//    
//}




- (IBAction)changeShapeType:(id)sender {
    
    // string "choiceVC" has to match up with storyboard id
    
    ChoiceViewController * choiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"choiceVC"];
    
    choiceVC.delegate = self;
    choiceVC.group = @"ShapeType";
    choiceVC.choices = @[
                         @"Scribble",
                         @"Line",
                         @"Rectangle",
                         @"Ellipse",
                         @"Triangle"
                         ];
    [self presentViewController:choiceVC animated:NO completion:nil];
}


- (IBAction)showHIdeDrawer:(UIButton *)sender {
    
//    typewritterButton.frame = CGRectMake(15, 165, 130, 25);
//    
//    typewritterButton.transform = CGAffineTransformMakeRotation((0.0174)*135);
//    
//    [m_overlay addSubview:typewritterButton];
    
    NSLog(@"%f", self.drawerLeftConstraint.constant);
    
    if (self.drawerLeftConstraint.constant == -16) {
        
        // opening
        
        CGRect frame = sender.frame;
        frame.origin.x = 462; // new x coordinate
        frame.origin.y = 562; // new y coordinate
        sender.frame = frame;
        
        sender.transform = CGAffineTransformMakeRotation((0.0174)*0);
        
   //     [self.view addSubview:sender];
        
        
        
        self.drawerLeftConstraint.constant = -266;
        
         _blackButton.hidden = YES;
        _blackFill.hidden = YES;
        
//        lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(7,445,40,40)];
//        lineImage.image = [UIImage imageNamed:@"shape_line.png"];
//        [self.view addSubview:lineImage];
        
        
        
        
    } else {
        
        // closing
        
 //       NSLog(@"%@", NSStringFromCGRect(sender.bounds));
        
        CGRect frame = sender.frame;
        frame.origin.x = 262; // new x coordinate
        frame.origin.y = 562; // new y coordinate
        sender.frame = frame;
        
        
        sender.transform = CGAffineTransformMakeRotation((0.0174)*180);
        
  //      [self.view addSubview:sender];
        
        self.drawerLeftConstraint.constant = -16;
        
        _blackButton.hidden = NO;
        _blackFill.hidden = NO;

        
        
    }
    
 //   self.drawerLeftConstraint.constant = (self.drawerLeftConstraint.constant == -16) ? -266:-16;
    
    
}







- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    
    currentScribble = [@{
                        // @"fill":@(fillornah),
                         @"alpha":@(selectedStrokeAlpha),
                         @"type":selectedShapeType,
                         @"blend":selectedBlendMode,
                         @"fillColor":selectedFillColor,
                         @"strokeColor":selectedstrokeColor,
                         @"strokeWidth":@(selectedStrokeWidth),
                        // @"strokeAlpha":@(selectedStrokeAlpha),
                         @"points":[@[[NSValue valueWithCGPoint:location]] mutableCopy],
                       //  @"sliderValue":[@[[NSValue valueWithCGPoint:location]] mutableCopy]
                         
                         } mutableCopy];
    

    
    
   
    
    
    ScribbleView * sView = (ScribbleView *)self.view;
    [sView.scribbles addObject:currentScribble];
    
//    CustomSlider *slView = [[CustomSlider alloc] init];
//    
//    [slView.sliderPoints addObject:currentSlider];
    

    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    
    
//    currentSlider = [@{
//                       
//                       @"sliderValue":[@[[NSValue valueWithCGPoint:location]] mutableCopy]
//                       
//                       } mutableCopy];
    
    
    
  //  [currentScribble[@"sliderValue"] addObject:[NSValue valueWithCGPoint:location]];
    
//     NSLog(@"slider value %@",currentScribble[@"sliderValue"]);
    
    if ([selectedShapeType isEqualToString:@"Scribble"]) {
        
        [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
        
    } else {
    
        currentScribble[@"points"][1] = [NSValue valueWithCGPoint:location];
        
     //   NSLog(@"values point zero %@",currentScribble[@"points"][0]);
     //   NSLog(@"values point one %@",currentScribble[@"points"][1]);
        
        
        
    }
    
    
    [self.view setNeedsDisplay];
}



@end
