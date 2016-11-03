-- Def: agent: Entity with agency (doh), so an agent is an object that has the capability to decide on behavior, using some decision method (one of which is player input)
local id = 0


return function(x,y)
 	local camera = {}
 	id =  id + 1
 	camera.name="agent".. id
	camera.position = {x=x,y=y}
	camera.no_scroll = {}
	return camera
end