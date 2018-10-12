scroll = new ScrollComponent
	width: 375
	height: Screen.height
	superLayer: device
	scrollHorizontal: false
items.superLayer = scroll.content
icon.superLayer = scroll.content

scroll.onScroll ->
# 	print scroll.scrollY
	gear1.rotation = scroll.scrollY/2
	gear2.rotation = scroll.scrollY/2
	gear3.rotation = scroll.scrollY/2
	gear4.rotation = scroll.scrollY/2
	
	