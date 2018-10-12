flow = new FlowComponent
flow.showOverlayBottom(map)
Framer.Device.background.image = "images/map.png"

button.animate
	y: 153
	opacity: 1

info.animate
	y: 108
	opacity: 1

moveArrow = ()=>
	arrow.animate
		rotation: Utils.randomNumber(0,50)
		options:
			curve: Bezier.ease
			time: 0.50

			
countdown = (num, delayVal, foo) ->
	countCurrent = num
	foo(countCurrent)
	countCurrent = countCurrent + 1
	if countCurrent > 10000
		return null
	else
		Utils.delay delayVal, ->
			countdown(countCurrent, delayVal, foo)
writeToLayer = (count) ->
	meter.text = count
button.onTap ->
	flow.showOverlayBottom(navi)
	countdown(0, 0.1, writeToLayer)
	Utils.delay 0.5, ->
		moveArrow()
		Utils.delay 1, ->
			moveArrow()
			Utils.delay 1, ->
				moveArrow()
				Utils.delay 1, ->
					moveArrow()
					Utils.delay 1, ->
						moveArrow()