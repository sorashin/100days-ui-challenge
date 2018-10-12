{getRandomHeart} = require "getRandomHeart"

isOpen = false
menu.states.add
	on:
		opacity:1
		y:menu.y
	off:
		opacity:0
		y:menu.y-10
	animationOptions:
		time: 0.30
		curve: Bezier.easeIn
menu.stateSwitch "off"
arrow.states.add
	on:
		rotation:180
	off:
		rotation:0
	animationOptions:
		time: 0.20
		curve: Bezier.easeIn
ripple.states.add
	on:
		width:280
		height:64
		opacity:0
	off:
		width:240
		height:44
		opacity:1
ripple.stateSwitch "off"

# Our original Heart to copy to create other colors
heartOriginal = new Layer
	name: "heart"
	width: 56,
	height: 56,
	image: "images/like.png"
heartOriginal.visible = false
heart =
	blue:   heartOriginal.copy()
	pink:   heartOriginal.copy()
	green:  heartOriginal.copy()
	brown:  heartOriginal.copy()
	violet: heartOriginal.copy()
	orange: heartOriginal.copy()
	yellow: heartOriginal.copy()
	original: heartOriginal
	
################################################################################
## CREATE STREAM

streamSize = 
	w: Screen.width/2
	h: Screen.height

	
streamPosition = 
	x: (Screen.width  - streamSize.w)/2
	y: Screen.height - streamSize.h
# thumbnail.clip = true
heartStream = new Layer
	superLayer: $027_Dropdown
	width:  streamSize.w
	height: streamSize.h/2
	x: streamPosition.x
	y: streamPosition.y/2-menuButton.height-60
	clip: false
	backgroundColor: "transparent"
heartStream.placeBehind(ripple)
################################################################################
################################################################################
## MAKE EMITTER

showHearts = () ->
	for i in [0..10]
		delay = Utils.randomNumber(0,.5)
		Utils.delay delay, ->
			# v Uses code above not the module
			# getRandomHeart()
			getRandomHeart(heart, streamSize, heartStream)


menuButton.onClick ->
	if isOpen
		menu.animate "off"
		arrow.animate "off"
			
	else
		menu.animate "on"
		arrow.animate "on"
	isOpen = !isOpen

menu.children[0].onClick ->
	if isOpen
		menu.animate "off"
		arrow.animate "off"
		task.text = menu.children[0].children[0].text
	isOpen = !isOpen
menu.children[1].onClick ->
	if isOpen
		menu.animate "off"
		arrow.animate "off"
		task.text = menu.children[1].children[0].text
	isOpen = !isOpen
menu.children[2].onClick ->
	if isOpen
		menu.animate "off"
		arrow.animate "off"
		task.text = menu.children[2].children[0].text
	isOpen = !isOpen
	
menu.children[3].onClick ->
	if isOpen
		menu.animate "off"
		arrow.animate "off"
		task.text = "Done"
		task.color = "#ffffff"
		arrowIcon.color = "#ffffff"
		menuButton.backgroundColor = "#68D0D9"
		showHearts()
		ripple.animate "on",
			time: 1.5
			curve: Spring
	isOpen = !isOpen


	
