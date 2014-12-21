PulsingHalo
===========

iOS Component For Creating A Pulsing Animation.

![](http://f.cl.ly/items/220D2F210D1x1D0L1Q20/beacon__.gif)

Great For  And Beacons:

- **Beacons for iBeacon**
- Map Annotations


##How to use

1. Add PulsingHaloLayer.h,m into your project
2. Initiate and add to your view.

````
PulsingHaloLayer *halo = [PulsingHaloLayer layer];
halo.position = self.view.center;
[self.view.layer addSublayer:halo];
````

##Install with CocoaPods

Add Podfile.

````
pod "PulsingHalo"
````

And

````
$ pod install
````


##Customization

###radius

Use `radius` property.

````
self.halo.radius = 240.0;
````

###color

Use `backgroundColor` property.

````
UIColor *color = [UIColor colorWithRed:0.7
                                 green:0.9
                                  blue:0.3
                                 alpha:1.0];

self.halo.backgroundColor = color.CGColor;
````

###animation duration

Use `animationDuration` or `pulseInterval` property.


##Demo

You can try to change radius and color properties with demo app.

![](http://f.cl.ly/items/031W0P1T190q382P063m/beacon_demo3.jpg)


##Special Thanks

It's inspired by [SVPulsingAnnotationView](https://github.com/samvermette/SVPulsingAnnotationView).
