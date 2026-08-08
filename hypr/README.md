-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + period", function ()
    local current = hl.get_config("general.layout")
    if current == "dwindle" then
        hl.config({ general = { layout = "master" } })
    elseif current == "master" then
        hl.config({ general = { layout = "scrolling" } })
    elseif current == "scrolling" then
        hl.config({ general = { layout = "monocle" } })
    else
        hl.config({ general = { layout = "dwindle" } })
    end
end)

if ws == 1 then
    hl.config({
        general = {
            layout = "scrolling"
        }
    })
elseif ws == 2 then
    hl.config({
        general = {
            layout = "master"
        }
    })
elseif ws == 3 then
    hl.config({
        general = {
            layout = "monocle"
        }
    })
elseif ws == 4 then
    hl.config({ 
        general = {
            layout = "dwindle"
        }
    })
end