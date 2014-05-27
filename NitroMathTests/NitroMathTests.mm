//
//  NitroMathTests.m
//  NitroMathTests
//
//  Created by Daniel L. Alves on 26/5/14.
//  Copyright (c) 2014 Daniel L. Alves. All rights reserved.
//

#import <XCTest/XCTest.h>

// nitro
#import "NTRMath.h"

#ifdef __cplusplus
using namespace nitro::math;
#endif

#pragma mark - Interface

@interface NitroMathTests : XCTestCase
@end

#pragma mark - Implementation

@implementation NitroMathTests

#pragma mark - lerp tests

-( void )test_lerp_zero_percent_returns_x
{
    float ret = lerp( 0.0f, 10.0f, 20.0f );
    XCTAssertEqual( ret, 10.0f );
}

-( void )test_lerp_a_hundred_percent_returns_y
{
    float ret = lerp( 1.0f, 10.0f, 20.0f );
    XCTAssertEqual( ret, 20.0f );
}

-( void )test_lerp_linear_interpolation
{
    float ret = lerp( 0.5f, 10.0f, 20.0f );
    XCTAssertEqual( ret, 15.0f );
}

-( void )test_lerp_accepts_percentages_less_than_zero
{
    float ret = lerp( -1.0f, 10.0f, 20.0f );
    XCTAssertEqual( ret, 0.0f );
}

-( void )test_lerp_accepts_percentages_greater_than_a_hundred
{
    float ret = lerp( 1.5f, 10.0f, 20.0f );
    XCTAssertEqual( ret, 25.0f );
    
    ret = lerp( 2.0f, 10.0f, 20.0f );
    XCTAssertEqual( ret, 30.0f );
}

#pragma mark - lerpi tests

-( void )test_lerpi_zero_percent_returns_x
{
    int ret = lerpi( 0, 10, 20 );
    XCTAssertEqual( ret, 10 );
}

-( void )test_lerpi_a_hundred_percent_returns_y
{
    int ret = lerpi( 100, 10, 20 );
    XCTAssertEqual( ret, 20 );
}

-( void )test_lerpi_linear_interpolation
{
    int ret = lerpi( 50, 10, 20 );
    XCTAssertEqual( ret, 15 );
}

-( void )test_lerpi_accepts_percentages_less_than_zero
{
    int ret = lerpi( -100, 10, 20 );
    XCTAssertEqual( ret, 0 );
}

-( void )test_lerpi_accepts_percentages_greater_than_a_hundred
{
    int ret = lerpi( 150, 10, 20 );
    XCTAssertEqual( ret, 25 );
    
    ret = lerpi( 200, 10, 20 );
    XCTAssertEqual( ret, 30 );
}

#pragma mark - clamp tests

-( void )test_clamp_returns_min_when_x_less_than_min
{
    float ret = clamp( 4.0f, 5.0f, 10.0f );
    XCTAssertEqual( ret, 5.0f );
}

-( void )test_clamp_returns_max_when_x_greater_than_max
{
    float ret = clamp( 14.0f, 5.0f, 10.0f );
    XCTAssertEqual( ret, 10.0f );
}

-( void )test_clamp_returns_x_when_x_between_min_and_max
{
    float ret = clamp( 0.5f, 0.0f, 1.0f );
    XCTAssertEqual( ret, 0.5f );
}

#pragma mark - clampi tests

-( void )test_clampi_returns_min_when_x_less_than_min
{
    int ret = clampi( 4, 5, 10 );
    XCTAssertEqual( ret, 5 );
}

-( void )test_clampi_returns_max_when_x_greater_than_max
{
    int ret = clampi( 14, 5, 10 );
    XCTAssertEqual( ret, 10 );
}

-( void )test_clampi_returns_x_when_x_between_min_and_max
{
    int ret = clampi( 3, 0, 10 );
    XCTAssertEqual( ret, 3 );
}

#pragma mark - luminance tests

-( void )test_luminance
{
    float ret = luminance( 0.0f, 0.0f, 0.0f );
    XCTAssertEqual( ret, 0.0f );
    
    ret = luminance( 1.0f, 0.0f, 0.0f );
    XCTAssertEqual( ret, 0.299f );
    
    ret = luminance( 0.0f, 1.0f, 0.0f );
    XCTAssertEqual( ret, 0.587f );
    
    ret = luminance( 0.0f, 0.0f, 1.0f );
    XCTAssertEqual( ret, 0.114f );
    
    ret = luminance( 1.0f, 1.0f, 1.0f );
    XCTAssertEqual( ret, 1.0f );
    
    ret = luminance( 0.3f, 0.5f, 0.8f );
    XCTAssertEqual( ret, ( 0.3f * 0.299f ) + ( 0.5f * 0.587f ) + ( 0.8f * 0.114f ) );
}

#pragma mark - luminancei tests

-( void )test_luminancei
{
    uint8_t ret = luminancei( 0, 0, 0 );
    XCTAssertEqual( ret, 0 );
    
    ret = luminancei( 255, 0, 0 );
    XCTAssertEqual( ret, 76 );
    
    ret = luminancei( 0, 255, 0 );
    XCTAssertEqual( ret, 150 );
    
    ret = luminancei( 0, 0, 255 );
    XCTAssertEqual( ret, 29 );
    
    ret = luminancei( 255, 255, 255 );
    XCTAssertEqual( ret, 255 );
    
    ret = luminancei( 76, 128, 204 );
    XCTAssertEqual( ret, (( 76 * 76 ) + ( 128 * 150 ) + ( 204 * 29 )) / 255 );
}

#pragma mark - degreesToRadians tests

-( void )test_degreesToRadians
{
    float ret = degreesToRadians( 90.0f );
    XCTAssertEqual( ret, ( float )M_PI_2 );
    
    ret = degreesToRadians( 180.0f );
    XCTAssertEqual( ret, ( float )M_PI );
    
    ret = degreesToRadians( 270.0f );
    XCTAssertEqual( ret, 3 * ( float )M_PI_2 );
    
    ret = degreesToRadians( 360.0f );
    XCTAssertEqual( ret, 2 * ( float )M_PI );
    
    ret = degreesToRadians( 45.0f );
    XCTAssertEqual( ret, ( float )M_PI_4 );
}

#pragma mark - radiansToDegrees tests

-( void )test_radiansToDegrees
{
    float ret = radiansToDegrees( M_PI_2 );
    XCTAssertEqual( ret, 90.0f );
    
    ret = radiansToDegrees( M_PI );
    XCTAssertEqual( ret, 180.0f );
    
    ret = radiansToDegrees( 3 * M_PI_2 );
    XCTAssertEqual( ret, 270.0f );
    
    ret = radiansToDegrees( 2 * M_PI );
    XCTAssertEqual( ret, 360.0f );
    
    ret = radiansToDegrees( M_PI_4 );
    XCTAssertEqual( ret, 45.0f );
}

#pragma mark - fcmp_e tests

-( void )test_fcmp_e
{
    int8_t ret = fcmp_e( 1.0f, 1.0f, 0.0f );
    XCTAssertEqual( ret, 0, @"f1 and f2 should be equal" );

    ret = fcmp_e( 1.0f, 1.00001f, 0.0f );
    XCTAssertNotEqual( ret, 0, @"f1 and f2 should not be equal" );

    ret = fcmp_e( 1.0f, 1.5f, 0.5f );
    XCTAssertEqual( ret, 0, @"f1 and f2 should be equal" );
    
    ret = fcmp_e( 1.5f, 1.0f, 0.5f );
    XCTAssertEqual( ret, 0, @"f1 and f2 should be equal" );

    ret = fcmp_e( 1.0f, 1.0f + ( 0.0001f + 0.00005f ), 0.0001f );
    XCTAssertEqual( ret, -1, @"f1 should be less than f2" );

    ret = fcmp_e( 1.0f + ( 0.0001f + 0.00005f ), 1.0f, 0.0001f );
    XCTAssertEqual( ret, 1, @"f1 should be greater than f2" );
}

-( void )test_fcmp
{
    int8_t ret = fcmp( 1.0f, 1.0f );
    XCTAssertEqual( ret, 0, @"f1 and f2 should be equal" );

    ret = fcmp( 1.0f, 1.0f + FLT_EPSILON - ( FLT_EPSILON / 2.0f ));
    XCTAssertEqual( ret, 0, @"f1 and f2 should be equal" );

    ret = fcmp( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ));
    XCTAssertEqual( ret, -1, @"f1 should be less than f2" );

    ret = fcmp( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f );
    XCTAssertEqual( ret, 1, @"f1 should be greater than f2" );
}

#pragma mark - feql_e tests

-( void )test_feql_e
{
    bool areEqual = feql_e( 1.0f, 1.0f, 0.0f );
    XCTAssertTrue( areEqual );

    areEqual = feql_e( 1.0f, 1.00001f, 0.0f );
    XCTAssertFalse( areEqual );
    
    areEqual = feql_e( 1.0f, 1.5f, 0.5f );
    XCTAssertTrue( areEqual );
    
    areEqual = feql_e( 1.5f, 1.0f, 0.5f );
    XCTAssertTrue( areEqual );
    
    areEqual = feql_e( 1.0f, 1.0f + ( 0.0001f + 0.00005f ), 0.0001f );
    XCTAssertFalse( areEqual );
    
    areEqual = feql_e( 1.0f + ( 0.0001f + 0.00005f ), 1.0f, 0.0001f );
    XCTAssertFalse( areEqual );
}

#pragma mark - feql tests

-( void )test_feql
{
    bool areEqual = feql( 1.0f, 1.0f );
    XCTAssertTrue( areEqual );
    
    areEqual = feql( 1.0f, 1.0f + FLT_EPSILON );
    XCTAssertTrue( areEqual );
    
    areEqual = feql( 1.0f + FLT_EPSILON, 1.0f );
    XCTAssertTrue( areEqual );
    
    areEqual = feql( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ) );
    XCTAssertFalse( areEqual );
    
    areEqual = feql( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f );
    XCTAssertFalse( areEqual );
}

#pragma mark - fdif_e tests

-( void )test_fdif_e
{
    bool areDifferent = fdif_e( 1.0f, 1.0f, 0.0f );
    XCTAssertFalse( areDifferent );
    
    areDifferent = fdif_e( 1.0f, 1.00001f, 0.0f );
    XCTAssertTrue( areDifferent );
    
    areDifferent = fdif_e( 1.0f, 1.5f, 0.5f );
    XCTAssertFalse( areDifferent );
    
    areDifferent = fdif_e( 1.5f, 1.0f, 0.5f );
    XCTAssertFalse( areDifferent );
    
    areDifferent = fdif_e( 1.0f, 1.0f + ( 0.0001f + 0.00005f ), 0.0001f );
    XCTAssertTrue( areDifferent );
    
    areDifferent = fdif_e( 1.0f + ( 0.0001f + 0.00005f ), 1.0f, 0.0001f );
    XCTAssertTrue( areDifferent );
}

#pragma mark - fdif tests

-( void )test_fdif
{
    bool areDifferent = fdif( 1.0f, 1.0f );
    XCTAssertFalse( areDifferent );
    
    areDifferent = fdif( 1.0f, 1.0f + FLT_EPSILON );
    XCTAssertFalse( areDifferent );
    
    areDifferent = fdif( 1.0f + FLT_EPSILON, 1.0f );
    XCTAssertFalse( areDifferent );
    
    areDifferent = fdif( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ));
    XCTAssertTrue( areDifferent );
    
    areDifferent = fdif( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f );
    XCTAssertTrue( areDifferent );
}

#pragma mark - fltn_e tests

-( void )test_fltn_e
{
    bool isLessThan = fltn_e( 1.0f, 2.0f, 0.0f );
    XCTAssertTrue( isLessThan, @"f1 should be less than f2" );
    
    isLessThan = fltn_e( 2.0f, 1.0f, 0.0f );
    XCTAssertFalse( isLessThan, @"f1 should be greater than f2" );
    
    isLessThan = fltn_e( 1.0f, 1.5f, 0.5f );
    XCTAssertFalse( isLessThan, @"f1 and f2 should be equal" );
    
    isLessThan = fltn_e( 1.5f, 1.0f, 0.5f );
    XCTAssertFalse( isLessThan, @"f1 and f2 should be equal" );
    
    isLessThan = fltn_e( 1.0f, 1.6f, 0.5f );
    XCTAssertTrue( isLessThan, @"f1 should be less than f2" );
    
    isLessThan = fltn_e( 1.6f, 1.0f, 0.5f );
    XCTAssertFalse( isLessThan, @"f1 should be greater than f2" );
    
    isLessThan = fltn_e( 1.0f, 1.0f + FLT_EPSILON, FLT_EPSILON );
    XCTAssertFalse( isLessThan, @"f1 and f2 should be equal" );
    
    isLessThan = fltn_e( 1.0f + FLT_EPSILON, 1.0f, FLT_EPSILON );
    XCTAssertFalse( isLessThan, @"f1 and f2 should be equal" );
    
    isLessThan = fltn_e( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), FLT_EPSILON );
    XCTAssertTrue( isLessThan, @"f1 should be less than f2" );
    
    isLessThan = fltn_e( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f, FLT_EPSILON );
    XCTAssertFalse( isLessThan, @"f1 should be greater than f2" );
}

#pragma mark - fltn tests

-( void )test_fltn
{
    bool isLessThan = fltn( 1.0f, 2.0f );
    XCTAssertTrue( isLessThan, @"f1 should be less than f2" );
    
    isLessThan = fltn( 2.0f, 1.0f );
    XCTAssertFalse( isLessThan, @"f1 should be greater than f2" );
    
    isLessThan = fltn( 1.0f, 1.0f + FLT_EPSILON );
    XCTAssertFalse( isLessThan, @"f1 and f2 should be equal" );
    
    isLessThan = fltn( 1.0f + FLT_EPSILON, 1.0f );
    XCTAssertFalse( isLessThan, @"f1 and f2 should be equal" );
    
    isLessThan = fltn( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ));
    XCTAssertTrue( isLessThan, @"f1 should be less than f2" );
    
    isLessThan = fltn( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f );
    XCTAssertFalse( isLessThan, @"f1 should be greater than f2" );
}

#pragma mark - fgtn_e tests

-( void )test_fgtn_e
{
    bool isGreaterThan = fgtn_e( 1.0f, 2.0f, 0.0f );
    XCTAssertFalse( isGreaterThan, @"f1 should be less than f2" );
    
    isGreaterThan = fgtn_e( 2.0f, 1.0f, 0.0f );
    XCTAssertTrue( isGreaterThan, @"f1 should be greater than f2" );
    
    isGreaterThan = fgtn_e( 1.0f, 1.5f, 0.5f );
    XCTAssertFalse( isGreaterThan, @"f1 and f2 should be equal" );
    
    isGreaterThan = fgtn_e( 1.5f, 1.0f, 0.5f );
    XCTAssertFalse( isGreaterThan, @"f1 and f2 should be equal" );
    
    isGreaterThan = fgtn_e( 1.6f, 1.0f, 0.5f );
    XCTAssertTrue( isGreaterThan, @"f1 should be greater than f2" );
    
    isGreaterThan = fgtn_e( 1.0f, 1.6f, 0.5f );
    XCTAssertFalse( isGreaterThan, @"f1 should be less than f2" );
    
    isGreaterThan = fgtn_e( 1.0f, 1.0f + FLT_EPSILON, FLT_EPSILON );
    XCTAssertFalse( isGreaterThan, @"f1 and f2 should be equal" );
    
    isGreaterThan = fgtn_e( 1.0f + FLT_EPSILON, 1.0f, FLT_EPSILON );
    XCTAssertFalse( isGreaterThan, @"f1 and f2 should be equal" );
    
    isGreaterThan = fgtn_e( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f, FLT_EPSILON );
    XCTAssertTrue( isGreaterThan, @"f1 should be greater than f2" );
    
    isGreaterThan = fgtn_e( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), FLT_EPSILON );
    XCTAssertFalse( isGreaterThan, @"f1 should be less than f2" );
}

#pragma mark - fgtn tests

-( void )test_fgtn
{
    bool isGreaterThan = fgtn( 1.0f, 2.0f );
    XCTAssertFalse( isGreaterThan, @"f1 should be less than f2" );
    
    isGreaterThan = fgtn( 2.0f, 1.0f );
    XCTAssertTrue( isGreaterThan, @"f1 should be greater than f2" );
    
    isGreaterThan = fgtn( 1.0f, 1.0f + FLT_EPSILON );
    XCTAssertFalse( isGreaterThan, @"f1 and f2 should be equal" );
    
    isGreaterThan = fgtn( 1.0f + FLT_EPSILON, 1.0f );
    XCTAssertFalse( isGreaterThan, @"f1 and f2 should be equal" );
    
    isGreaterThan = fgtn( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f );
    XCTAssertTrue( isGreaterThan, @"f1 should be greater than f2" );
    
    isGreaterThan = fgtn( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ) );
    XCTAssertFalse( isGreaterThan, @"f1 should be less than f2" );
}

#pragma mark - fleq_e tests

-( void )test_fleq_e
{
    bool isLessThanOrEqual = fleq_e( 1.0f, 2.0f, 0.0f );
    XCTAssertTrue( isLessThanOrEqual, @"f1 should be less than f2" );
    
    isLessThanOrEqual = fleq_e( 2.0f, 1.0f, 0.0f );
    XCTAssertFalse( isLessThanOrEqual, @"f1 should be greater than f2" );
    
    isLessThanOrEqual = fleq_e( 1.0f, 1.5f, 0.5f );
    XCTAssertTrue( isLessThanOrEqual, @"f1 and f2 should be equal" );
    
    isLessThanOrEqual = fleq_e( 1.5f, 1.0f, 0.5f );
    XCTAssertTrue( isLessThanOrEqual, @"f1 and f2 should be equal" );
    
    isLessThanOrEqual = fleq_e( 1.0f, 1.6f, 0.5f );
    XCTAssertTrue( isLessThanOrEqual, @"f1 should be less than f2" );
    
    isLessThanOrEqual = fleq_e( 1.6f, 1.0f, 0.5f );
    XCTAssertFalse( isLessThanOrEqual, @"f1 should be greater than f2" );
    
    isLessThanOrEqual = fleq_e( 1.0f, 1.0f + FLT_EPSILON, FLT_EPSILON );
    XCTAssertTrue( isLessThanOrEqual, @"f1 and f2 should be equal" );
    
    isLessThanOrEqual = fleq_e( 1.0f + FLT_EPSILON, 1.0f, FLT_EPSILON );
    XCTAssertTrue( isLessThanOrEqual, @"f1 and f2 should be equal" );
    
    isLessThanOrEqual = fleq_e( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), FLT_EPSILON );
    XCTAssertTrue( isLessThanOrEqual, @"f1 should be less than f2" );
    
    isLessThanOrEqual = fleq_e( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f, FLT_EPSILON );
    XCTAssertFalse( isLessThanOrEqual, @"f1 should be greater than f2" );
}

#pragma mark - fleq tests

-( void )test_fleq
{
    bool isLessThanOrEqual = fleq( 1.0f, 2.0f );
    XCTAssertTrue( isLessThanOrEqual, @"f1 should be less than f2" );
    
    isLessThanOrEqual = fleq( 2.0f, 1.0f );
    XCTAssertFalse( isLessThanOrEqual, @"f1 should be greater than f2" );
    
    isLessThanOrEqual = fleq( 1.0f, 1.0f + FLT_EPSILON );
    XCTAssertTrue( isLessThanOrEqual, @"f1 and f2 should be equal" );
    
    isLessThanOrEqual = fleq( 1.0f + FLT_EPSILON, 1.0f );
    XCTAssertTrue( isLessThanOrEqual, @"f1 and f2 should be equal" );
    
    isLessThanOrEqual = fleq( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ));
    XCTAssertTrue( isLessThanOrEqual, @"f1 should be less than f2" );
    
    isLessThanOrEqual = fleq( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f );
    XCTAssertFalse( isLessThanOrEqual, @"f1 should be greater than f2" );
}

#pragma mark - fgeq_e tests

-( void )test_fgeq_e
{
    bool isGreaterThanOrEqual = fgeq_e( 1.0f, 2.0f, 0.0f );
    XCTAssertFalse( isGreaterThanOrEqual, @"f1 should be less than f2" );
    
    isGreaterThanOrEqual = fgeq_e( 2.0f, 1.0f, 0.0f );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 should be greater than f2" );
    
    isGreaterThanOrEqual = fgeq_e( 1.0f, 1.5f, 0.5f );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 and f2 should be equal" );
    
    isGreaterThanOrEqual = fgeq_e( 1.5f, 1.0f, 0.5f );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 and f2 should be equal" );
    
    isGreaterThanOrEqual = fgeq_e( 1.6f, 1.0f, 0.5f );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 should be greater than f2" );
    
    isGreaterThanOrEqual = fgeq_e( 1.0f, 1.6f, 0.5f );
    XCTAssertFalse( isGreaterThanOrEqual, @"f1 should be less than f2" );
    
    isGreaterThanOrEqual = fgeq_e( 1.0f, 1.0f + FLT_EPSILON, FLT_EPSILON );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 and f2 should be equal" );
    
    isGreaterThanOrEqual = fgeq_e( 1.0f + FLT_EPSILON, 1.0f, FLT_EPSILON );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 and f2 should be equal" );
    
    isGreaterThanOrEqual = fgeq_e( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f, FLT_EPSILON );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 should be greater than f2" );
    
    isGreaterThanOrEqual = fgeq_e( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), FLT_EPSILON );
    XCTAssertFalse( isGreaterThanOrEqual, @"f1 should be less than f2" );
}

#pragma mark - fgeq tests

-( void )test_fgeq
{
    bool isGreaterThanOrEqual = fgeq( 1.0f, 2.0f );
    XCTAssertFalse( isGreaterThanOrEqual, @"f1 should be less than f2" );
    
    isGreaterThanOrEqual = fgeq( 2.0f, 1.0f );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 should be greater than f2" );
    
    isGreaterThanOrEqual = fgeq( 1.0f, 1.0f + FLT_EPSILON );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 and f2 should be equal" );
    
    isGreaterThanOrEqual = fgeq( 1.0f + FLT_EPSILON, 1.0f );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 and f2 should be equal" );
    
    isGreaterThanOrEqual = fgeq( 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ), 1.0f );
    XCTAssertTrue( isGreaterThanOrEqual, @"f1 should be greater than f2" );
    
    isGreaterThanOrEqual = fgeq( 1.0f, 1.0f + FLT_EPSILON + ( FLT_EPSILON / 2.0f ) );
    XCTAssertFalse( isGreaterThanOrEqual, @"f1 should be less than f2" );
}

@end










































