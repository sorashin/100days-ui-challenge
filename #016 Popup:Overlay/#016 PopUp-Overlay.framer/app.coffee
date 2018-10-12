
videoL = new VideoLayer
	width: 320	
	height: 500
	x: Align.center
	y: Align.center
	borderRadius: 10
	superLayer: dialog
	clip: true
	video: "videos/dialog.mp4"
videoL.placeBehind(button)
videoL.player.autoplay = true