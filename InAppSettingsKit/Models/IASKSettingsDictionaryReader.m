//
//	IASKSettingsDictionaryReader.m
//	http://www.inappsettingskit.com
//
//	Copyright (c) 2009:
//	Luc Vandal, Edovia Inc., http://www.edovia.com
//	Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//	All rights reserved.
// 
//	It is appreciated but not required that you give credit to Luc Vandal and Ortwin Gentz, 
//	as the original authors of this code. You can give credit in a blog post, a tweet or on 
//	a info page of your app. Also, the original authors appreciate letting them know if you use this code.
//
//	This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php
//

#import "IASKSettingsDictionaryReader.h"



@implementation IASKSettingsDictionaryReader


- (id)init
{
	NSLog( @"IASKSettingsDictionaryReader - Must use initWithDictionary:" );
    
    
    return nil;
}



-(id)initWithDictionary:(NSDictionary *)dictionary
//- (id)initWithFile:(NSString*)file
{
	if(( self = [ super init ]))
    {
		//self.path = [self locateSettingsFile: file];
		[ self setSettingsBundle:[ NSDictionary dictionaryWithDictionary:dictionary ]];
		//self.bundlePath = [self.path stringByDeletingLastPathComponent];
		//_bundle = [[NSBundle bundleWithPath:[self bundlePath]] retain];
		
		// Look for localization file
		self.localizationTable = [ self.settingsBundle objectForKey:@"StringsTable" ];
		if (!self.localizationTable)
		{
			// Look for localization file using filename
			self.localizationTable = [[[[self.path stringByDeletingPathExtension] // removes '.plist'
										stringByDeletingPathExtension] // removes potential '.inApp'
									   lastPathComponent] // strip absolute path
									  stringByReplacingOccurrencesOfString:[self platformSuffix] withString:@""]; // removes potential '~device' (~ipad, ~iphone)
			if([_bundle pathForResource:self.localizationTable ofType:@"strings"] == nil){
				// Could not find the specified localization: use default
				self.localizationTable = @"Root";
			}
		}
        
        
        if (_settingsBundle)
        {
			[self _reinterpretBundle:_settingsBundle];
		}
	}
    
	return self;
}

- (void)dealloc
{
	[ super dealloc ];
}




@end
