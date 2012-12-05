//
//  IASKTextField.m
//  http://www.inappsettingskit.com
//
//  Copyright (c) 2009:
//  Luc Vandal, Edovia Inc., http://www.edovia.com
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  All rights reserved.
// 
//  It is appreciated but not required that you give credit to Luc Vandal and Ortwin Gentz, 
//  as the original authors of this code. You can give credit in a blog post, a tweet or on 
//  a info page of your app. Also, the original authors appreciate letting them know if you use this code.
//
//  This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php
//

#import "IASKTextField.h"


@implementation IASKTextField

@synthesize key=_key;

- (void)dealloc
{
    [_key release], _key = nil;
    [_dateFormat release];
	
    [super dealloc];
}


-(void)setDateFormat:(NSString *)dateFormat
{
    [ _dateFormat release ];
    _dateFormat = [ dateFormat retain ];
    
    if( dateFormat && dateFormat.length )
    {
        UIDatePicker *datePicker = [[[ UIDatePicker alloc ] init ] autorelease ];
        datePicker.datePickerMode = UIDatePickerModeDate;
        [ self addTarget:self action:@selector(dateValueChanged:) forControlEvents:UIControlEventEditingChanged ];
        [ datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged ];
        self.inputView = datePicker;
    }
}


-(void)datePickerValueChanged:(id)sender
{
    //NSLog( @"datePickerValueChanged" );
    
    UIDatePicker *datePicker = sender;
    
    NSDateFormatter *dateFormatter = [ NSDateFormatter new ];
    
    NSLog( @"dateFormatter.timeStyle: %d", dateFormatter.timeStyle );
    NSLog( @"dateFormatter.dateStyle: %d", dateFormatter.dateStyle );
    
    dateFormatter.locale = [ NSLocale currentLocale ];
    [ dateFormatter setDateFormat:self.dateFormat ];
    NSString *datetime = [ dateFormatter stringFromDate:datePicker.date ];
    [ dateFormatter release ];
    
    self.text = datetime;
    
    [ self sendActionsForControlEvents:UIControlEventEditingChanged ];
}


-(void)dateValueChanged:(id)sender
{
    //NSLog( @"dateValueChanged" );
    
    UIDatePicker *datePicker = (UIDatePicker *)self.inputView;
    
    NSDateFormatter *dateFormatter = [ NSDateFormatter new ];
    dateFormatter.locale = [ NSLocale currentLocale ];
    [ dateFormatter setDateFormat:self.dateFormat ];
    NSDate *date = [ dateFormatter dateFromString:self.text ];
    [ dateFormatter release ];
    
    if( date && ![ date isEqualToDate:datePicker.date ])
    {
        [ datePicker setDate:date animated:YES ];
    }
}



@end
