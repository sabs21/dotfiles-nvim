-- Check if the environment file exists.
-- If not, create it before the require statement is called.
local env_file = io.open(".\\lua\\environment.lua", "r")
if env_file~=nil
then
	-- Environment file exists.
	io.close(env_file)
else
	-- Copy the environment example file
	local example_env = io.open(".\\lua\\environment.lua.example", "r")
	local example_env_contents = example_env:read("*a")
	example_env:close()

	-- Paste into a new environment file
	env_file = io.open(".\\lua\\environment.lua", "w")
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
