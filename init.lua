-- Lua bases relative paths against the current working directory,
-- not where the actual executing file is. This causes issues when
-- launching Neovim from anywhere on the disk.
-- 
-- Using the following code, we're able to get the absolute
-- file path of the executing lua script.
function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*[/\\])") or "./"
end

-- Check if the environment file exists.
-- If not, create it before the require statement is called.
print(script_path())
local env_file = io.open(script_path() .. "\\lua\\environment.lua", "r")
if env_file~=nil
then
	-- Environment file exists.
	io.close(env_file)
else
	-- Copy the environment example file
	local example_env = io.open(script_path() .. "\\lua\\environment.lua.example", "r")
	local example_env_contents = example_env:read("*a")
	example_env:close()

	-- Paste into a new environment file
	env_file = io.open(script_path() .. "\\lua\\environment.lua", "w")
	env_file:write(example_env_contents)
	env_file:close()

	print("Created an environment file inside the lua folder")
end

require("environment")
require("autocmd")
require("detectOS")
require("set")
require("remap")
require("lazy.lazy")
