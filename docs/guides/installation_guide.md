# Installation Guide

To install the coq-waterproof-natded plugin, follow these steps:

# 1. Install dependencies and editor.
## Option 1: Install Waterproof VSCode Extension
Waterproof is accessible through a VSCode extension built on coq-lsp.
The extension is available on the [VSCode Marketplace](https://marketplace.visualstudio.com/items?itemName=waterproof-tue.waterproof).
More detailed installation instructions can be found on its [GitHub repository](https://github.com/impermeable/waterproof-vscode).

## Option 2: Install coq-lsp and coq-waterproof, and use your editor of choice
Since coq-lsp implements the Language Server Protocol, it can be used with any editor that supports the protocol, such as Vim, Emacs, most IDEs, etc. CoqIDE is also an option.

**Install coq-lsp and coq-waterproof using opam:**

#### 1. Install Opam
> We assume that you are using a Debian-based system, like Ubuntu. For Windows we recommend using the Linux instructions, through [WSL](https://docs.microsoft.com/en-us/windows/wsl/install). For other OSes, please refer to the [opam installation guide](https://opam.ocaml.org/doc/Install.html).
```bash
sudo apt install opam # get it from apt
opam init             # and initialize it
```
every time you want to make use of your opam installation, you need to run
```bash
eval $(opam env)
```
Alternatively, you can allow `opam init` to make changes to your shell profile, e.g. `~/.zshrc` or `~/.bashrc`, to automatically run `eval $(opam env)` every time you open a new shell.

#### 2. Install coq-lsp and coq-waterproof
```bash
opam install coq-lsp.0.2.2+8.17
opam install coq-waterproof
```

# 3. Build and Install coq-waterproof-natded
Clone the repository:
```
git clone https://github.com/swekkiekekkie/coq-waterproof-natded.git
```

Navigate to the repository folder and build the package:
```bash
dune build -p coq-waterproof-natded
```

Then install it using:
```bash
dune install -p coq-waterproof-natded
```

# 4. Usage
When everything is installed correctly, you should be able to load the library in your proof files with:
```coq
From waterproof-natded Require Import Notations.
```
