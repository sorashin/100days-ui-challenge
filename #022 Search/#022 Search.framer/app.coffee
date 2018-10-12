isSearch = false

searchBar.states.add
	on:
		width:400
		height:56
		borderRadius:28
		animationOptions:
			curve: 'spring'
			time: 0.3
	off:
		width:56
		height:56
		borderRadius:28
		animationOptions:
			curve: 'spring'
			time: 0.3
searchBar.stateSwitch 'off'



searchBar.onClick ->
	if isSearch
		searchBar.animate 'off'
		isSearch = false
	else if !isSearch
		searchBar.animate 'on'
		isSearch = true