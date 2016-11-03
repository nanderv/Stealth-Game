local id = 0
return function(x,y, rot, route)
 	local agent = {}
 	id =  id + 1
 	agent.name       ="agent".. id
	agent.position   = {x=x, y=y, rotation=rot,speed = 100}
	agent.managed_anger = {suspicion={time=5}}
	agent.idle = {idle=100}
	agent.current_route = {"idle", 1}
		agent.bump_shape = {w = 32, h = 32}

	agent.routes = {idle=route}
	agent.view_cone = {fov=100, distance = 600}
	return agent
end