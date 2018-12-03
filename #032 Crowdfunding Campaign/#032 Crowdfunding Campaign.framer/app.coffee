isFav=false
toggleFav =()=>
	isFav=!isFav
	if isFav
		favIcon.scale = 0.8
		favIcon.animate
			scale: 1
			color:"#FF8F66"
			options: 
				time: .25
	else
		favIcon.scale = 0.8
		favIcon.animate
			scale: 1
			color : "#cccccc"
			options: 
				time: .25
	

showBaloon =()=>
	if isFav
		comment.animate
			y: comment.y-5
			opacity: 1
			options: 
				time: .25
		Utils.delay 1, ->
			comment.animate
				y: comment.y+5
				opacity: 0
				options: 
					time: .5
		

fav.onClick ->
	toggleFav()
	showBaloon()