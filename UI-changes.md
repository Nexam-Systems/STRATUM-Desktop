# UI Changes to make as per the slide numbers

## Slide-2
The greenbox title “QGroundControl Daily” should be “STRATUM with version number. 

## Slide-3
1. The define AOP, Takeoff, return to base and land must be like buttons. And shoudl match the accent color we have right now. 
2. When user presses takeoff, a new pop up should appear which should ask user for takeoff altitude and caution that pressing ok will launch the vehicle to desired altitude. 
3. There is a built in feature in qgroundcontrol where whenever a new flight mode is swithced, a bar appears on top which user has to long press. I want that bar to be placed in the bottom. it is ergonomically more convenient. 

## slide-4
1. during vehicle in flight, upon left click we get a menu like go to location, orbit at location, ROI at location etc. I want them all gone. 
2. instead I want an option called "Standoff here". When a user presses this, a pop should appear asking for standoff distance, standoff height, standoff angle. 
3. standoff distance means how far away from the standoff target the vehicle should be. standoff height is how high. standoff direction/angle is from which direction the vehicle should face the standoff target. 
4. when the vehicle reaches the standoff point, stratum should ask continue to orbit around standoff target? if you look closely these are basically same params as orbit but in a different sense. Standoff distance, ehight, direction all make paramsters for orbit. 

## Slide-5
1. A new button called Engage. It will invoke a flight mode present in PX4. Just place the button for now without any functions. accent should match.


It should be known that all UI changes above should also hold true when video to map and vice versa is switched. 
