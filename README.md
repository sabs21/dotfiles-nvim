A config for Neovim v0.12.2 that includes
- Automatic formatting
- LSP (Language Server Protocol)

## Setup
Before we go installing anything from `:Mason`, we want to ensure an errorless setup. This involves running `:checkhealth` and resolving any errors and warnings listed that would impact you. 

Programs required to be installed and added to your PATH:
- **ripgrep** (https://github.com/BurntSushi/ripgrep)
  - Used for fast fuzzy finding
- **tree-sitter** (https://github.com/tree-sitter/tree-sitter)
  - Used for parsing languages to allow for jumping to definitions and support for LSPs.
- **C/C++ compiler**
  - I use clang (https://releases.llvm.org/download.html)
  - Enables the ability to add a debugger via LLDB and is a dependency for the tree-sitter manager 
- **delta** (https://github.com/dandavison/delta)
  - Used for visualized git diffs
