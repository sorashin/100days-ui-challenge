{Scene, Studio, Model} = require 'form'

scene = new Studio
	width: 320
	height: 320
	superLayer: detail
	borderRadius: 375/2
	clip:true
	x: Align.center
	y: 150
	borderWidth:4
	borderColor:"#FFF6EB"
	
pageContents = [head, scene, photos, details,info]

scroll = new ScrollComponent
	width: 375
	height: 667
	superLayer: detail
	scrollHorizontal:false
for i in [0...pageContents.length]
	pageContents[i].superLayer = scroll.content

# Create layer
buyBtn = new Layer
	x: Align.center
	y: Screen.height-80
	height: 44
	width: 240
	borderRadius: 22
	backgroundColor: "#FFBD80"
	shadowSpread: 2	
	shadowColor: "rgba(255,189,128,0.56	)"
	shadowBlur: 10
buyText=new TextLayer
	text: "BUY"
	superLayer: buyBtn
	x: Align.center
	y: Align.center
	fontSize: 18
	fontWeight: "bold"
	color: "#fff"
	
	
scene.camera.y = 300
scene.camera.rotationX = -16

new Model
	path: './models/TABLE-DAE.dae'
	parent: scene
	scale: 300
	rotationY: -40
	material: new THREE.MeshPhongMaterial
		color: 0xF0FAF9
		specular: 0xF0FAF9
		flatShading: true
		path: './models/tex/texture.jpg'
	onLoad: (model) ->
		
		clock = new THREE.Clock

		scene.on Events.Pan, (e) ->
			model.rotationY += e.deltaX * .8
# 			t.text = 'Rotation Y: ' + model.rotationY.toFixed()

		scene.animationLoop = () ->
			model.y = Math.sin(clock.getElapsedTime()) * 10 + 140

scroll.onScroll ->
	scene.camera.y = 300-scroll.scrollY/300*300
	scene.camera.rotationX = -16+scroll.scrollY/300*32
