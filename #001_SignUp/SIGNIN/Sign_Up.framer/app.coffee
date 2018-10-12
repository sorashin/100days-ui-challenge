{InputLayer} = require "input"
Framer.Device.background.backgroundColor = "#b5ece9"
moveelements=[]
fadearray = []

moveelements.push form1, form2, signin, twitter, facebook
for i in [0...moveelements.length]
	moveelements[i].states.add
		on:
			opacity:1
			y: moveelements[i].y
			animationOptions:
				delay:.2*i
# 				curve:Spring(tension: 80, friction: 20)
		off:
			opacity:0
			y: moveelements[i].y+30
	moveelements[i].stateSwitch "off"

email1.originX=0
email1.originY=0
input1 = new InputLayer
	superLayer:form1
	x:20
	y:3
	width:200
	height:44
	lineheight:44
	fontSize:24
	fontWeight:600
	color :"#9B9B9B"
	text: "   "
	backgroundColor:null
email1.states.add
	on:
		x:email1.x
		y:email1.y-10
		scale:.5
		animationOptions:
			time:.3
	off:
		x:email1.x
		y:email1.y
		scale:1
		animationOptions:
			time:.3
email1.stateSwitch "off"
form1.onClick ->
	email1.animate "on"
input1.onInputBlur ->
	email1.animate "off"

email2.originX=0
email2.originY=0
input2 = new InputLayer
	superLayer:form2
	x:20
	y:3
	width:200
	height:44
	lineheight:44
	fontSize:24
	fontWeight:600
	color :"#9B9B9B"
	text: "   "
	backgroundColor:null
email2.states.add
	on:
		x:email2.x
		y:email2.y-10
		scale:.5
		animationOptions:
			time:.3
	off:
		x:email2.x
		y:email2.y
		scale:1
		animationOptions:
			time:.3
email2.stateSwitch "off"
form2.onClick ->
	email2.animate "on"
input2.onInputBlur ->
	email2.animate "off"


bg1.states.add
	on:
		y:bg1.y
		opacity:1
		animationOptions:
			time:2
	off:
		y:bg1.y+50
		opacity:0
bg1.stateSwitch "off"
bg2.states.add
	on:
		y:bg2.y
		opacity:1
	off:
		y:bg2.y+30
		opacity:0
bg2.stateSwitch "off"
bg2.states.add
	on:
		y:bg2.y
		opacity:1
	off:
		y:bg2.y+30
		opacity:0
bg2.stateSwitch "off"

bg1Up = new Animation bg1,
	bg1.states.on
	time:2
bg2Up = new Animation bg2,
	bg2.states.on
	time:2

fadearray.push nav1, nav2, selector
for i in [0...fadearray.length]
	fadearray[i].states.add
		on:
			opacity:1
			y: fadearray[i].y
			animationOptions:
				time:1
		off:
			opacity:0
			y: fadearray[i].y
	fadearray[i].stateSwitch "off"

Utils.delay 1, ->
	for j in [0...moveelements.length]
		moveelements[j].animate "on"
	for j in [0...fadearray.length]
		fadearray[j].animate "on"
	bg1Up.start()
	bg2Up.start()

# Framer.Device.background.backgroundColor = "#8DDDD9"