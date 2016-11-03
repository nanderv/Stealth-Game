local loading = {}
loading.loaded = 1
-- Loading screen phases, split up loading code among these phases
loading.loaded_paths = {}
require 'zz_lib.core_maths'
function my_require (str)
    loading.loaded_paths[str] = str
    return require (str)
end


loading.phases = {
    core.reset_game,
    require 'entities.load_all_entity_definitions',
    function()
         for k,v in pairs (loading.loaded_paths) do
            package.loaded[v] = nil        
         end
        collectgarbage("collect")

        
        next_id = next_id_func()
        game.resources = {}
        -- require component types
    end,
    require 'states.loading_functions.load_systems', 
    function()

        core.entity.add(game.entity_definitions.enemies.empty_enemy(110,100, 2, {{x=100,y=100},{x=100,y=200},{x=200,y=200},{x=200,y=100}, {x= 400,y= 100}}))
        core.entity.add(game.entity_definitions.enemies.empty_enemy(200,200, 2, {{x=600,y=600},{x=100,y=200}}))
        core.entity.add(game.entity_definitions.player.player(400,400, 20))
        core.entity.add(game.entity_definitions.wall.base_wall(500,400))

    end,
}


function loading:enter(from)
    print("STARTING LOADING")
    loading.loaded=1
end


-- Leave loading screen
function loading:leave(from)

    for k,v in pairs(game.systems) do
        print("Running system "..v.name)
    end
    print("FINISHED LOADING")
end


function loading:update()
    if self.loaded <= #self.phases then
        self.phases[self.loaded]()
        self.loaded = self.loaded + 1
        --        love.timer.sleep(0.01)

    else
        GS:pop()
    end

end


-- Draw loading screen
function loading:draw()
    
end 


function loading:keypressed(key)

end
return loading

