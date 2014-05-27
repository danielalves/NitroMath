NitroMath
==========

[![Cocoapods](https://cocoapod-badges.herokuapp.com/v/NitroMath/badge.png)](http://cocoapods.org/?q=NitroMath)
[![Platform](http://cocoapod-badges.herokuapp.com/p/NitroMath/badge.png)](http://cocoadocs.org/docsets/NitroMath)
[![TravisCI](https://travis-ci.org/danielalves/NitroMath.svg?branch=master)](https://travis-ci.org/danielalves/NitroMath)

**NitroMath** is a set of mathematical utilities for C, C++ and ObjC which aims to boost coding performance.

Usually, there are some mathematical functions that people keep redeclaring and reimplementing on many projects just because they are simple to write (how many times did you code lerp?). Well, this could become a maintenance nightmare: there could be name clashes, different implementations for the same function, different names for functions doing the same thing, improvements which are not used, extra bytes on your executable, more unit tests written and etc.

**NitroMath** try to put together some of the math functions me and my colleagues use on almost every game/app we make. All functions are C, C++ and ObjC compliant. They are also inline functions, so there's an extra hint for the compiler to optimize them.

What you will find:

* **lerp** (float and integer versions): Linear interpolation - used on LOTS of animations;
 
* **clamp** (float and integer versions): Keeps a value in the interval [min, max];
 
* **luminance** (float and integer versions): Luminance of a RGB color - very handy for sepia, greyscale, handling the outline of an image which is drawn on top of background with varying color, and so on
 
* **degreesToRadians** (float version only)

* **radiansToDegrees** (float version only)
 
* **Floating point numbers absolute error comparison utilities**: consider two float numbers different only if the difference between them is grater than epsilon. For an in-depth discussion, see http://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/

Installation
------------

**NitroMath** is available through [CocoaPods](http://cocoapods.org), to install it simply add the following line to your Podfile:

```ruby
pod "NitroMath"
```

Author
------

- [Daniel L. Alves](http://github.com/danielalves) ([@alveslopesdan](https://twitter.com/alveslopesdan))

License
-------

**NitroMath** is available under the MIT license. See the LICENSE file for more info.
