#!/usr/bin/env lua

-- Switch between wmii tags by using the `wmiir` tool directly.
--
--
-- Copy this script to your wmii config folder (e.g. `~/.wmii-3.5`) and set
-- the execute flag:
--
--   chmod u+x tagswitcher.lua
--
-- Then edit `wmiirc` (copy an example config if it doesn't exist) and add
-- the following line as one of the first lines:
--
--   TAGSWITCHER=`dirname $0`/tagswitcher.lua
--
-- In your key binding section, add the following lines:
--
--   Key $MODKEY-Left
--       `$TAGSWITCHER previous`
--   Key $MODKEY-Right
--       `$TAGSWITCHER next`
--   Key $MODKEY-Home
--       `$TAGSWITCHER first`
--   Key $MODKEY-End
--       `$TAGSWITCHER last`
--
-- You should now be able to jump to the previous/next/first/last tag with the
-- <Left>/<Right>/<Home>/<End> key, respectively.
--
-- To avoid Lua bytecode regeneration, the following command saves the result
-- to a file named `tagswitcher`:
--
--   luac -o tagswitcher tagswitcher.lua
--
-- Then change the `TAGSWITCHER` value like this:
--
--   TAGSWITCHER=lua `dirname $0`/tagswitcher

function get_all_tags()
    local tags = {}
    local f = io.popen("wmiir ls /tag")
    for line in f:lines() do
        -- Remove trailing slash.
        if line:sub(-1) == "/" then
            line = line:sub(0, -2)
        end
        -- Skip current selection path.
        if line ~= "sel" then
            table.insert(tags, line)
        end
    end
    f:close()
    return tags
end

function get_selected_tag()
    local f = io.popen("wmiir read /tag/sel/ctl")
    -- Read the first line which represents the current selection.
    local line = f:read("*l")
    f:close()
    return line
end

function reverse_table(t)
    local reversed = {}
    for i = #t, 1, -1 do
        table.insert(reversed, t[i])
    end
    return reversed
end

function find_tag_index(tags, selected)
    for i, tag in ipairs(tags) do
        if tag == selected then
            return i
        end
    end
end

function get_next_tag(reverse)
    local tags = get_all_tags()
    if reverse then
        tags = reverse_table(tags)
    end
    local selected = get_selected_tag()
    local index = find_tag_index(tags, selected)
    return tags[(index % #tags) + 1]
end

function view_tag(name)
    os.execute("wmiir xwrite /ctl view " .. name)
end

local cmds = {
    {"list", "List available tags.", function()
        print(table.concat(get_all_tags(), "\n"))
    end},

    {"previous", "Switch to the previous tag.", function()
        view_tag(get_next_tag(true))
    end},

    {"next", "Switch to the next tag.", function()
        view_tag(get_next_tag())
    end},

    {"first", "Switch to the first tag.", function()
        view_tag(get_all_tags()[1])
    end},

    {"last", "Switch to the last tag.", function()
        local tags = get_all_tags()
        view_tag(tags[#tags])
    end},
}
table.insert(cmds, 1,
    {"help", "List available commands.", function()
        for i, cmd in pairs(cmds) do
            io.write(string.format("  %-8s\t%s\n", cmd[1], cmd[2]))
        end
    end})

for i, cmd in ipairs(cmds) do
    if cmd[1] == arg[1] then
        cmd[3]()
        os.exit(0)
    end
end
print("Unknown command. See '" .. arg[0] .. " help' for available commands.")
os.exit(2)
