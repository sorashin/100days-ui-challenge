exports.getRandomHeart = (heart, streamSize, heartStream) ->

  	vertFloatLayer = new Layer
  		width:  heart.original.width
  		height: heart.original.height
  		y: streamSize.h - 270
  		superLayer: heartStream
  		backgroundColor: "transparent"
  		clip: false

  	vertFloatLayer.centerX()

  	## > Create The Animation

  	floatUp = new Animation
  		layer: vertFloatLayer
  		properties:  y: 0, opacity: 0
  		time: 4.5
  		curve: "ease-out"

  	vertFloatLayer.on Events.AnimationEnd, (animation, layer) ->
  		layer.destroy()

  	floatUp.start()

  	# Create the Horizontal float

  	horzFloatLayer = new Layer
  		width:  heart.original.width
  		height: heart.original.width
  		superLayer: vertFloatLayer
  		backgroundColor: "transparent"
  		clip: false

  	heartAnimationProps =
  		x: Utils.randomNumber(5, streamSize.w/1 - horzFloatLayer.width)
  		r: Utils.randomNumber(2, 10)
  		t: 3
  		c: "ease-in-out"

  	floatLeft = new Animation
  		layer: horzFloatLayer
  		properties:
  			x: horzFloatLayer.x - heartAnimationProps.x
  			rotation: heartAnimationProps.r
  		time: heartAnimationProps.t
  		curve: heartAnimationProps.c

  	floatRight = new Animation
  		layer: horzFloatLayer
  		properties:
  			x: horzFloatLayer.x + heartAnimationProps.x
  			rotation: -heartAnimationProps.r
  		time: heartAnimationProps.t
  		curve: heartAnimationProps.c

  	# Loop the animation: Code found vvv
  	# http://framerjs.com/docs/#animation.reverse

  	floatLeft.start
  	floatRight.start

  	# Start with a left or right float first
  	Utils.randomChoice( [floatLeft, floatRight] ).start()

  	# Put a random heart in the float wrapper

  	newHeart = Utils.randomChoice([
  		heart.blue,
  		heart.pink,
  		heart.green,
  		heart.brown,
  		heart.violet,
  		heart.orange,
  		heart.yellow
  	]).copy()

  	horzFloatLayer.addSubLayer newHeart
  	newHeart.visible = true
  	newHeart.scale = 0
  	newHeart.originY = 1

  	newHeart.animate
  		properties:
  			scale: .5
  		time: .25
  		curve: "spring(100, 30, 35)"
