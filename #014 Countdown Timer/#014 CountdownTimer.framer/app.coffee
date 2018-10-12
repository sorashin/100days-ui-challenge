class Clock extends Layer
	constructor: (@num) ->
		super
			backgroundColor: "#49E4A6"
			width: 80
			height: 4
			borderRadius:2
			rotation:@num
			
		@style =
			"font-size" : "40px"
			"text-align" : "center",
			"line-height" : "#{@.height}px"
		
		@onTapStart ->
			@backgroundColor = "#a00"
		
		@onTapEnd ->
			@backgroundColor = "#c00"

		rotate = new Animation @,
			rotation: @num + 360
			backgroundColor: "#ff7200"
			options:
				time: 20
				curve: Bezier.linear
		rotate.start()
count = 0
for j in [0...6]
	y = j*100+50
	for k in [0...8]
		x = k*100
		count = count+1
		clock = new Clock count*10
		clock.superLayer = clocks
		clock.x = x
		clock.y = y


date= null
hhTarget = 20 #this is your target hour
mmTarget = 60
ssTarget = 60
hhCurrent = null
mmCurrent = null
ssCurrent = null
hhDelta = null
mmDelta = null
ssDelta = null

# Add 0 to numbers below 10 to force 2 digits
checkTime = (i) -> if i < 10 then "0" + i else i
#Define Update Function
updateTime = () ->
	date = new Date()
	hhCurrent = checkTime(date.getHours())
	mmCurrent = checkTime(date.getMinutes())
	ssCurrent = checkTime(date.getSeconds())
	
	if hhCurrent >= hhTarget then hhDelta = checkTime(hhTarget - hhCurrent + 24 - 1)
	else hhDelta = checkTime(hhTarget - hhCurrent - 1)
	mmDelta = checkTime(mmTarget - mmCurrent - 1)
	ssDelta = checkTime(ssTarget - ssCurrent - 1)
# 	time.text = hhDelta + ":" + mmDelta + ":" + ssDelta
	hh.text = hhDelta
	mm.text = mmDelta
	ss.text = ssDelta

#Call immediately at startup, then update each second
updateTime()
Utils.interval 1, -> 
	updateTime()