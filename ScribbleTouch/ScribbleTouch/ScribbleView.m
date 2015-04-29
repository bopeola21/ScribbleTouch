//
//  ScribbleView.m
//  ScribbleTouch
//
//  Created by Jide Opeola on 1/16/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ScribbleView.h"

@implementation ScribbleView

//    @[
//
//        @{
//            @"type":@"path",
//            @"fillColor":[UIColor greenColor],
//            @"strokeColor":[UIColor blackColor],
//            @"strokeWidth":@2,
//            @"points":@[CGPoint,CGPoint,CGPoint]
//        },
//
//        @{
//            @"type":@"circle",
//            @"fillColor":[UIColor greenColor],
//            @"strokeColor":[UIColor blackColor],
//            @"strokeWidth":@2,
//            @"frame":CGRect
//        }
//
//    ];



- (NSMutableArray *)scribbles {
    
    if (_scribbles == nil) { _scribbles = [@[] mutableCopy]; }
    return _scribbles;
  
    
}



- (void)drawRect:(CGRect)rect {
    
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextSetLineCap(context, kCGLineCapRound);
    
    
    for (NSDictionary * scribble in self.scribbles) {
        
        NSArray * points = scribble[@"points"];
        if (points.count < 2) continue;
        
        [self addToContext:context withScribble:scribble andType:@"Fill"];
        [self addToContext:context withScribble:scribble andType:@"Stroke"];
        
    }
    
}

- (void)addToContext:(CGContextRef)context withScribble:(NSDictionary *)scribble andType:(NSString *)type {
    
    NSArray * shapeTypes = @[
                             @"Scribble",
                             @"Line",
                             @"Rectangle",
                             @"Ellipse",
                             @"Triangle"
                             ];
    
    NSArray * points = scribble[@"points"];
    
    ///////// STROKE COLOR & WIDTH
    
    CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
  //  CGContextSetAlpha(context, [scribble[@"alpha"] floatValue]);
    
    CGPoint firstPoint = [points[0] CGPointValue];
    CGPoint secondPoint = [points[1] CGPointValue];
    
    CGFloat width = secondPoint.x - firstPoint.x;
    CGFloat height = secondPoint.y - firstPoint.y;
    
    CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
    
    switch ([shapeTypes indexOfObject:scribble[@"type"]]) {
            
        case 0: // Scribble
        case 1: // Line
            
            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
            
            for (NSValue * pointValue in scribble[@"points"]) {
                
                CGPoint point = [pointValue CGPointValue];
                CGContextAddLineToPoint(context, point.x, point.y);
                
            }
            
            break;
            
        case 2 : // Rectangle
            
            CGContextAddRect(context, rect);
            
            break;
            
        case 3 : // Ellipse
            
            CGContextAddEllipseInRect(context, rect);
            
            break;
            
        case 4 : // Triangle
            
            CGContextMoveToPoint(context, firstPoint.x + width / 2, firstPoint.y);
            CGContextAddLineToPoint(context, secondPoint.x, secondPoint.y);
            CGContextAddLineToPoint(context, firstPoint.x, secondPoint.y);
            CGContextAddLineToPoint(context, firstPoint.x + width / 2, firstPoint.y);
            
            break;
            
        default:
            break;
    }
    
    if ([type isEqualToString:@"Fill"]) {
        
        UIColor * fillColor = scribble[@"fillColor"];
        
        [fillColor set];
        CGContextFillPath(context);
        
    } else {
        
        UIColor * strokeColor = scribble[@"strokeColor"];
        [strokeColor set];
        CGContextStrokePath(context);
        
    }
    
}

@end


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    
//    // Drawing code
////    
//    CGContextRef context = UIGraphicsGetCurrentContext();
////    
////    CGContextSetLineJoin(context, kCGLineJoinRound);
////    CGContextSetLineCap(context, kCGLineCapRound);
//    
//    for (NSDictionary * scribble in self.scribbles) {
//        
//        ///////////// STROKE COLOR & WIDTH
//        
//        CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
//         CGContextSetAlpha(context, [scribble[@"alpha"] floatValue]);
//        
//        UIColor * strokeColor = scribble[@"strokeColor"];
//        [strokeColor set];
//        
//        //////////// BUILD STROKE PATH
//        
//        BOOL typeIsScribble = [scribble[@"type"] isEqualToString:@"Scribble"];
//        BOOL typeIsLine = [scribble[@"type"] isEqualToString:@"Line"];
//        
//        if (typeIsScribble || typeIsLine) {
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
//            
//            for (NSValue * pointValue in scribble[@"points"]) {
//                
//                CGPoint point = [pointValue CGPointValue];
//                CGContextAddLineToPoint(context, point.x, point.y);
//                
//            }
//            
//        }
//        
//        
//        if ([scribble[@"type"] isEqualToString:@"Rectangle"]) {
//           
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//            
//            CGFloat width = secondPoint.x - firstPoint.x;
//            CGFloat height = secondPoint.y - firstPoint.y;
//            
//            CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//            
//            CGContextAddRect(context, rect);
//            
//            
//            
////            
////            CGContextMoveToPoint(context, 0, 0);
////            
////            CGContextAddLineToPoint(context, rect.size.width, 0);
////            CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
////            CGContextAddLineToPoint(context, 0, rect.size.height);
////            CGContextAddLineToPoint(context, 0, 0);
////            
//            CGContextFillPath(context);
//            
//        }
//        
//        if ([scribble[@"type"] isEqualToString:@"Triangle"]) {
//            
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//            
//            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
//            
//            CGContextAddLineToPoint(context, secondPoint.x, secondPoint.y);
//            
//            CGContextAddLineToPoint(context, (firstPoint.x)*2, secondPoint.y);
//            
//            CGContextAddLineToPoint(context, firstPoint.x,firstPoint.y);
//            
//            CGContextAddRect(context, rect);
//            
//        }
//        
//         if ([scribble[@"type"] isEqualToString:@"Ellipse"]) {
//             
//             CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//             CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//             
//             
//             
//             CGFloat w = secondPoint.x - firstPoint.x;
//             CGFloat h = secondPoint.y - firstPoint.y;
//             
////             CGFloat xCP1 = firstPoint.x / 4;
////             CGFloat yCP1 = firstPoint.y / 4;
//             
//             CGFloat xCP2 = secondPoint.x / 8;
//             CGFloat yCP2 = secondPoint.y / 8;
//             
//             CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
//             
//             CGContextAddCurveToPoint(context, w, yCP2, w, h/2, h, 0);
//             
//             CGContextAddCurveToPoint(context, w - xCP2, 0, w, yCP2, w, h / 2);
//             
//             CGContextAddCurveToPoint(context, w, h-yCP2, w-xCP2, h, w/2, h);
//             
//             CGContextAddCurveToPoint(context, xCP2, h, 0, h-yCP2, 0, h/2);
//             
//             CGContextAddCurveToPoint(context, 0, yCP2, xCP2, 0, w/2, 0);
//             
//             
//         }
//        
//        
//        if ([scribble[@"fill" ] boolValue] == NO) {
//            CGContextStrokePath(context);
//            
//            
//            
//        } else {
//            CGContextFillPath(context);
//        }
//    
//        
//        
//    }
//    
//}
//
//@end
