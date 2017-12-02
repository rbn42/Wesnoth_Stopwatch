local result =
    wesnoth.synchronize_choice(
    function()
        local t0 = wesnoth.get_time_stamp()
        return {value = t0}
    end
)
local vname = "Stopwatch_start" .. wesnoth.current.side
wesnoth.set_variable(vname, result.value)
