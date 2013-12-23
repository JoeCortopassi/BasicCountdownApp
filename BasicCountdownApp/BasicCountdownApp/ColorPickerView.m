//
//  ColorPickerView.m
//  BasicCountdownApp
//
//  Created by Joseph Cortopassi on 12/23/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "ColorPickerView.h"





@interface ColorPickerView ()
@property (nonatomic, assign) int rowCount;
@property (nonatomic, assign) int colCount;
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) CGFloat gutter;
@end






typedef enum {
    kWhite = 0,
    kCyan,
    kGreen,
    kYellow,
    kOrange,
    kMagenta,
    kGray,
    kRed,
    kBlue,
    kBrown,
    kPurple,
    kBlack
} ColorChoices;




@implementation ColorPickerView

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        self.rowCount = 4;
        self.colCount = 3;
        self.margin = 20;
        self.gutter = 10;
        self.arrayOfButtonsColors = [[NSMutableArray alloc] initWithCapacity:(self.rowCount * self.colCount)];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void) layoutSubviews
{
    [super layoutSubviews];
    
    [self setupButtonsColors];
}



- (void) setupButtonsColors
{
    CGRect colorGridBoundary = CGRectMake(self.margin, self.margin, self.frame.size.width-(self.margin*2), self.frame.size.height-(self.margin*2));

    for (int row=0; row<self.rowCount; row++)
    {
        for (int col=0; col<self.colCount; col++)
        {
            CGPoint origin = [self colorButtonGetOriginForRow:row andColumn:col withBoundary:colorGridBoundary];
            CGSize size = [self colorButtonGetSizeForRowCount:self.rowCount andColumnCount:self.colCount withBoundary:colorGridBoundary];
            CGRect buttonFrame = CGRectMake(origin.x, origin.y, size.width, size.height);
            
            int colorChoice = col + (row * self.colCount);
            
            [self createColorButtonWithFrame:buttonFrame andColor:colorChoice];
        }
    }
}


/**************************************/
# pragma mark -
# pragma mark Color Button Grid Methods
# pragma mark -
/**************************************/


- (void) createColorButtonWithFrame:(CGRect)buttonFrame andColor:(ColorChoices)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonFrame;
    button.backgroundColor = [self getColorForColorChoice:color];
    [button setTitle:@"" forState:UIControlStateNormal];
    button.layer.cornerRadius = 10;
    button.layer.shouldRasterize = YES;
    button.layer.borderColor = [UIColor darkGrayColor].CGColor;
    button.layer.borderWidth = 1;
    button.clipsToBounds = YES;
    [button addTarget:self action:@selector(nilSymbol) forControlEvents:UIControlEventTouchUpInside];
    
    [self.arrayOfButtonsColors insertObject:button atIndex:color];
    
    
    [self addSubview:button];
}


- (CGPoint) colorButtonGetOriginForRow:(int)row andColumn:(int)column withBoundary:(CGRect)boundary
{
    CGSize buttonSize = [self colorButtonGetSizeForRowCount:self.rowCount andColumnCount:self.colCount withBoundary:boundary];
    
    CGFloat x = boundary.origin.x + ((buttonSize.width * column) + (column * self.gutter));
    CGFloat y = boundary.origin.y + ((buttonSize.height * row) + (row * self.gutter));
    
    x = (x>0)? x: 0;
    y = (y>0)? y: 0;
    
    return CGPointMake(x, y);
}


- (CGSize) colorButtonGetSizeForRowCount:(int)rowCount andColumnCount:(int)columnCount withBoundary:(CGRect)boundary
{
    CGFloat gutter = 10;
    
    CGFloat width = (boundary.size.width - ((columnCount-1) * gutter))/columnCount;
    CGFloat height = (boundary.size.height - ((rowCount-1) * gutter))/rowCount;
    
    
    return CGSizeMake(width, height);
}


- (UIColor *) getColorForColorChoice:(ColorChoices)choice
{
    UIColor *color;
    
    switch (choice)
    {
        case kBlack:
            color = [UIColor blackColor];
            break;
        case kWhite:
            color = [UIColor whiteColor];
            break;
        case kGray:
            color = [UIColor lightGrayColor];
            break;
        case kRed:
            color = [UIColor redColor];
            break;
        case kGreen:
            color = [UIColor greenColor];
            break;
        case kBlue:
            color = [UIColor blueColor];
            break;
        case kCyan:
            color = [UIColor cyanColor];
            break;
        case kYellow:
            color = [UIColor yellowColor];
            break;
        case kMagenta:
            color = [UIColor magentaColor];
            break;
        case kOrange:
            color = [UIColor orangeColor];
            break;
        case kPurple:
            color = [UIColor purpleColor];
            break;
        case kBrown:
            color = [UIColor brownColor];
            break;
        default:
            break;
    }
    
    
    return color;
}



@end
