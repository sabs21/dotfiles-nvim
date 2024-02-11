A config for Neovim that includes
- Automatic formatting
- Autocomplete
- LSP

Programs required to be installed outside of neovim:
- BurntSushi/ripgrep (https://github.com/BurntSushi/ripgrep)
- nvim-treesitter/nvim-treesitter
  - make sure auto_install = true in the config
  - Requires c compilers to run
		1. install git (not required on newer versions of Windows 10, tar is installed and curl is bundled with Neovim)
		2. Install MinGW toolchain
		  2a. Via chocolatey: choco install mingw (in admin powershell)
		3. Start Neovim in a refreshed environment: refreshenv
		4. Install parsers in Neovim via :TSInstall c, :TSInstall cpp
- williamboman/mason.nvim
  - Add "C:\Users\Nick\AppData\Local\nvim-data\mason\bin" to the PATH
