//
//  Constants.h
//  PetsAlliance
//
//  Created by Mark Miyashita on 6/14/13.
//  Copyright (c) 2013 Mark Miyashita. All rights reserved.
//

#ifndef PetsAlliance_Constants_h
#define PetsAlliance_Constants_h

#define PROD NO

#if TARGET_IPHONE_SIMULATOR
#define LOCALURL @"http://pro.local:3000/api/v1/"
#else
#define LOCALURL @"http://petsalliance.herokuapp.com/api/v1/"
#endif

#define IS_IPHONE5 ([[UIScreen mainScreen] applicationFrame].size.height == 548)
#define IS_IPHONE4 ([[UIScreen mainScreen] applicationFrame].size.height == 460)
#define IS_IPAD ([[UIScreen mainScreen] applicationFrame].size.height == 1004)

#endif
