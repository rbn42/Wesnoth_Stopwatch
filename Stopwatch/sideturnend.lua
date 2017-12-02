local result =
    wesnoth.synchronize_choice(
    function()
        local t0 = wesnoth.get_time_stamp()
        return {value = t0}
    end
)
local time_end = result.value
local vname = "Stopwatch_start" .. wesnoth.current.side
local time_start = wesnoth.get_variable(vname)
local duration = time_end - time_start
vname = "Stopwatch_overall" .. wesnoth.current.side
local time_overall = wesnoth.get_variable(vname)
if time_overall == nil then
    time_overall = 0
end
time_overall = time_overall + duration
wesnoth.set_variable(vname, time_overall)
local name = wesnoth.sides[wesnoth.current.side].name
local t = duration
t = math.floor(t / 1000)
if t > 100 then
    t = math.ceil(t / 60) .. "m"
else
    t = t .. "s"
end
duration = t
t = time_overall
t = math.floor(t / 1000)
if t > 100 then
    t = math.ceil(t / 60) .. "m"
else
    t = t .. "s"
end
time_overall = t
wesnoth.message(name, "finished turn in " .. duration .. " (" .. time_overall .. " overall).")
