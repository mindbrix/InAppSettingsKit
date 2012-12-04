//
//  IASKSettingsStoreFile.m
//  http://www.inappsettingskit.com
//
//  Copyright (c) 2010:
//  Luc Vandal, Edovia Inc., http://www.edovia.com
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  Marc-Etienne M.Léveillé, Edovia Inc., http://www.edovia.com
//  All rights reserved.
// 
//  It is appreciated but not required that you give credit to Luc Vandal and Ortwin Gentz, 
//  as the original authors of this code. You can give credit in a blog post, a tweet or on 
//  a info page of your app. Also, the original authors appreciate letting them know if you use this code.
//
//  This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php
//

#import "IASKSettingsStoreDictionary.h"


@implementation IASKSettingsStoreDictionary

-(id) initWithDictionary:(NSDictionary *)dictionary
{
    if((self = [super init]))
    {
        if( dictionary )
        {
            self.dictionary = [[ NSMutableDictionary alloc ] initWithDictionary:dictionary ];
        }
        else
        {
            self.dictionary = [[ NSMutableDictionary alloc ] initWithCapacity:100 ];
        }
    }
    return self;
}

- (void)dealloc
{
    [_dictionary release ];
    [super dealloc];
}


- (void)setObject:(id)value forKey:(NSString *)key
{
    //NSLog( @"IASKSettingsStoreDictionary: setObject %@ forKey:%@", value, key );
    
    [_dictionary setObject:value forKey:key];
}

- (id)objectForKey:(NSString *)key
{
    //NSLog( @"IASKSettingsStoreDictionary: objectForKey: %@", key );
    
    return [_dictionary objectForKey:key];
}

- (BOOL)synchronize
{
    //NSLog( @"IASKSettingsStoreDictionary: synchronize" );
    
    return YES;
    //return [_dictionary writeToFile:_filePath atomically:YES];
}

@end
