base = new Layer
# 	superLayer: Tweet
	backgroundColor: "#fff"
	shadowSpread: 1
	shadowColor: "rgba(0,0,0,0.1)"
	shadowBlur: 8
	x: Align.center
	y: Align.center
	

	
Tweet.superLayer = base
Tweet.x = Tweet.y = 0
TwtContents.states.add
	on:
		opacity:1
		animationOptions:
			curve: Bezier.ease
			time: 0.5
	off:
		opacity:0
		animationOptions:
			curve: Bezier.ease
			time: 0.5
TwtContents.stateSwitch "off"

base.states.add
	start:
		width:56
		height:56
		borderRadius: 28
		x: Screen.width/2-28
		y: Screen.height/2+28
		image: "images/tweet.png"
		opacity:0
		animationOptions :
			curve: Bezier.ease
			time: 0.8
	on:
		width:360
		height: 255
		borderRadius: 10
		x: 220
		y: 175
		image:""
		animationOptions :
			curve: Bezier.ease
			time: 0.4
		
	off:
		width:56
		height:56
		borderRadius: 28
		x: Screen.width/2-28
		y: Screen.height/2-28
		image: "images/tweet.png"
		opacity:1
		animationOptions :
			curve: Bezier.ease
			time: 0.8
base.stateSwitch "start"
base.animate "off"


class LoadingBar extends Layer
	constructor: (@options = {}) ->
		@options.height ?= 5
		super @options
		Utils.insertCSS("
				@-webkit-keyframes Loading {
				    0%{background-position:0% 50%}
				    50%{background-position:100% 50%}
				    100%{background-position:0% 50%}
				}
				@-moz-keyframes Loading {
				    0%{background-position:0% 50%}
				    50%{background-position:100% 50%}
				    100%{background-position:0% 50%}
				}
				@keyframes Loading { 
				    0%{background-position:0% 50%}
				    50%{background-position:100% 50%}
				    100%{background-position:0% 50%}
				}
		  ")
	
		cssText = """
				height: #{@.height}px;
				background: linear-gradient(91deg, #eeeeee, #cccccc, #eeeeee);
				background-size: 600% 600%;
				
				-webkit-animation: Loading 4s ease infinite;
				-moz-animation: Loading 4s ease infinite;
				animation: Loading 4s ease infinite;
			"""
		@.html = "<div style='#{cssText};'>&nbsp;</div>"
		


	
base.onClick ->
	base.image = ""
	base.stateCycle("on","off")
	Utils.delay .3, ->
		skeletonIcon = new LoadingBar
			width: 44
			height: 44	
			x: 15
			y: 5
			borderRadius: 22
			superLayer:Tweet
		skeletonProfile = new LoadingBar
			width: 44
			height: 44	
			x: 301
			y: 5
			borderRadius: 22
			superLayer:Tweet
		skeletonHead = new LoadingBar
			width: 200
			height: 24	
			x: 15
			y: 75
			superLayer: Tweet
		skeletonBody1 = new LoadingBar
			width: 310
			height: 15
			x: 25
			y: 124
			superLayer: Tweet
		skeletonBody2 = new LoadingBar
			width: 310
			height: 15
			x: 25
			y: 144
			superLayer: Tweet
		skeletonBody3 = new LoadingBar
			width: 310
			height: 15
			x: 25
			y: 164
			superLayer: Tweet
		Utils.delay 2, ->
			skeletonIcon.destroy()
			skeletonProfile.destroy()
			skeletonHead.destroy()
			skeletonBody1.destroy()
			skeletonBody2.destroy()
			skeletonBody3.destroy()
			TwtContents.animate "on"
	
	