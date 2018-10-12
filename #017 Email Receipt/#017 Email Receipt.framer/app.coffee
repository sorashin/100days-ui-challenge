{LottieLayer} = require 'LottieLayer'

shipping = new LottieLayer
	name: "customAnim"
	path: "images/shipping.json"
	superLayer:detail
	loop: false
	autoplay:false
	x:Align.center
	y: 140
	width:308
	height:20

detail.states =
	on:
		opacity:1
		y: 50
		animationOptions:
			time:1
			curve: "ease-in-out"
	off:
		opacity: 0
		y: 100
detail.stateSwitch "off"
detail.animate "on"

photo.states =
	on:
		opacity:1
		x: 60
		animationOptions:
			time:1
			curve: "ease-in-out"
	off:
		opacity: 0
		x: 200
photo.stateSwitch "off"
Utils.delay 1, ->
	photo.animate "on"
Utils.delay 2, ->
	shipping.play()