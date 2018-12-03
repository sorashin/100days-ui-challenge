
PairModule = require "Pair"

isDragAnimation=false
ripple.opacity = 0
dropArea.clip = true
fileSize.opacity=0
iconUp = new Animation uploadIcon,
	color:"#ffffff"
	y:uploadIcon.y-5
	options:
		time:0.8
		curve: "ease-out"

iconDown = new Animation uploadIcon,
	color:"#ffffff"
	y:uploadIcon.y+5
	options:
		time:0.8
		curve: "ease-out"


iconUp.onAnimationEnd ->
	if isDragAnimation
		iconDown.start()
iconDown.onAnimationEnd ->
	if isDragAnimation
		iconUp.start()
iconOff =()->
	isDragAnimation=false
	uploadIcon.animate
		color: "#36C1DE"
switchButton=(@switch)=>
	if @switch
		button.animate
			options: 
				time: .5
			backgroundColor: "#fff"
		buttonText.animate
			options: 
				time: .5
			color: "#36C1DE"
		
	if !@switch
		button.animate
			options: 
				time: .5
			backgroundColor: "#36C1DE"
		buttonText.animate
			options: 
				time: .5
			color: "#ffffff"

pair = new PairModule.Pair(file,dropArea)
pair.enableDragAndDrop()

file.onMouseOver ->
	@animate
		options:
			time:0.25
		scale:1.2
file.onMouseOut ->	

	# this shouldn't need to be here but... webtech, ¯\_(ツ)_/¯
	return if file.ignoreEvents 
	iconOff()
	switchButton(false)
	@animate
		options:
			time:0.25		
		scale:1		

dropArea.onMouseOver ->
	ripple.animate
		options:
			time:0.35	
		opacity: 1
	isDragAnimation=true
	iconUp.start()
	switchButton(true)

# 	
dropArea.onMouseOut ->
	ripple.animate
		options:
			time:0.35	
		opacity: 0
	iconOff()
	switchButton(false)

pair.onDragStart (dragged)->
	dragged._startX = dropArea.width/2
	dragged._startY = dropArea.height/2
# 
pair.onDragEnter (dragged,dropTarget)->
	dragged.animate
		options:
			time:0.25
		scale:0.8
			
	ripple.animate
		options:
			time:0.35
		opacity: 1
	isDragAnimation=true
	iconUp.start()
	switchButton(true)
# 
pair.onDragOver ->
	isDragAnimation=true
	iconUp.start()
	switchButton(true)
	# ¯\_(ツ)_/¯
# 	
pair.onDragLeave (dragged,formerDropTarget)->
	iconOff()
	switchButton(false)
	dragged.animate
		options:
			time:0.25		
		scale:1.1
		opacity:1.0
		borderWidth:5
		
	formerDropTarget.animate
		options:
			time:0.35		
		borderWidth:0
		scale:1
	
	
# 	
pair.onInvalidDrop (dropped)->	
	print "this is invalid drop"
	dropped.animate
		options:
			time:0.35		
		x:dropped._startX
		y:dropped._startY
	ripple.animate
		options:
			time:1		
		opacity: 0
# 	
pair.onDrop (dropped,dropTarget)->
# 	print "droped"
	dropArea.ignoreEvents = true
	dropped.ignoreEvents = true	
# 		
	dropped.animate
		options:
			time:0.25		
		scale: 0
		midX:dropArea.midX
		midY:dropArea.midY
		opacity:0
	contents.animate
		options: 
			time:0.25
		opacity: 0
		y: contents.y+10
	circle.animate
		options: 
			time:0.25
		opacity:1
		scale:1
	fileSize.animate
		options: 
			time:0.5
		opacity: 1
		y: fileSize.y-10
	fill.start()
	
	
# Draw circle
radius  = 50
stroke  = 6
viewBox = (radius * 2) + stroke

circle = new Layer
  width:  viewBox
  height: viewBox
  backgroundColor: ''
  rotation: -90
  opacity: 0
  scale: 0.5
  superLayer: dropArea

counter = new TextLayer
	text: 0
	superLayer: circle
	rotation: 90
	width: 200
	textAlign: "center"
	fontSize: 28
	fontWeight: "bold"
	color: "#ffffff"
	x: Align.center
	y: Align.center
	
circle.center()
circle.placeBehind(fileSize)
circle.pathLength = 2 * Math.PI * radius

circle.html = """
  <svg viewBox='-#{stroke/2} -#{stroke/2} #{viewBox} #{viewBox}'>
    <circle fill='none' stroke='#36C1DE' stroke-linecap='round'
      stroke-width      = '#{stroke}'
      stroke-dasharray  = '#{circle.pathLength}'
      stroke-dashoffset = '#{circle.pathLength}'
      cx = '#{radius}'
      cy = '#{radius}'
      r  = '#{radius}'>
  </svg>"""
  
# Create proxy
proxy = new Layer visible: false, x: .1

proxy.on 'change:x', ->
  offset = Utils.modulate(@.x, [0, 100], [circle.pathLength, 0])
  circle.path.setAttribute 'stroke-dashoffset', offset 
  counter.text =  Math.floor(@.x)+"%"


# Create animation
fill = new Animation
    layer: proxy
    properties: x: 100
    curve: 'spring(50,14,0)'
fill.onAnimationEnd ->
	counter.animate
		options: 
			time:0.5
		opacity: 0
		x: counter.x-5
	circle.animate
		options: 
			time:0.5
		scale: 0.3
	Utils.delay 0.5, ->
		circle.animate
			options: 
				time:0.8
			scale: 0.5
		Utils.delay 0.8, ->
			circle.animate
				options: 
					time:0.8
				scale: 0.2
			Utils.delay 0.8, ->
				circle.html=""
# 				circle.image = "images/movie.png"
				circle.borderRadius=100
				circle.opacity = 0
				circle.rotation = 0
				circle.backgroundColor="#62ADBC"
				bgImage = new Layer
					superLayer: dropArea
					width: 500
					height: 500
					borderRadius: 300
					x: Align.center
					y: Align.center
					image:"images/movie.png"
					scale: 1
					opacity: 0
				bgImage.placeBefore(circle)
# 				bgImage.centerX()
# 				bgImage.centerY()
				circle.animate
					options: 
						time:0.3
						curve: "ease-out"
					scale: 1
					width: 500
					height: 500
					x: -250+200
					y: -250+150
					opacity: 1
					borderRadius:300
				bgImage.animate
					options: 
						time:0.3
						curve: "ease-out"
						delay:.3
					scale: 1
					opacity: 1
				
# Run animation
Utils.domComplete ->
  circle.path = document.querySelector('svg circle')
  