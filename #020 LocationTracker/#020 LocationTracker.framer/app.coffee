# Require input module
{InputLayer} = require "input"
	
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
				background-size: 200% 200%;
				
				-webkit-animation: Loading 4s ease infinite;
				-moz-animation: Loading 4s ease infinite;
				animation: Loading 4s ease infinite;
			"""
		@.html = "<div style='#{cssText};'>&nbsp;</div>"


input = new InputLayer
	width: inputWrap.width
	height: inputWrap.height
	y:1
	superLayer:inputWrap
	
	
mapWrap.opacity = 0
skeleton = new LoadingBar
	width: 300
	height:140
	borderRadius: 5
	x: 10
	y: 10
	clip:true
	superLayer: mapWrap
	
ripple = new Layer
	midY: 69
	x: Align.center
	width: 30
	height: 30
	borderRadius: 15
	scale: 0
	superLayer: pin
	backgroundColor: "rgba(246, 141, 141,.4)"
rippleOn = new Animation ripple,
	scale:1

rippleOff = new Animation ripple,
	scale:0
	options:
		time: 0
rippleOn.start()
rippleOn.onAnimationEnd ->
	rippleOff.start()
rippleOff.onAnimationEnd ->
	rippleOn.start()

	

loader = new Layer
	width: 0
	height: 5
	superLayer: skeleton
	backgroundColor: "#E57373"



input.onEnterKey ->
	mapWrap.animate
		opacity: 1
		options: 
			time: 0.001
			
	loader.animate
		width: 320
		options: 
			curve: "ease-in"
	loader.onAnimationEnd ->
		Utils.delay 1, ->
			loader.animate
				opacity : 0
				
			skeleton.animate
				opacity : 0
			rippleOn.start()