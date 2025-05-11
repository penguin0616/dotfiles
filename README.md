# Dotfiles

## Setup

1. Install a Nerd Font. I used ["Caskaydia Mono Nerd Font"](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaMono.zip), but more can be found at https://www.nerdfonts.com/font-downloads.  
2. Install [Oh My Posh](https://ohmyposh.dev).
3. Extract dotfiles folder to your home directory (so you should have ``~/dotfiles``)
4. Back up your existing dotfiles.
5. Run ``~/dotfiles/setup.sh``.

### Configuring VSCode Terminal

The setting in question that needs to be changed is ``terminal.integrated.fontFamily``.  
- Example: ``'CaskaydiaMono Nerd Font Mono', 'monospace', monospace``

## Debugging

Information on incorrect colors can be found on this [GitHub Issue](https://github.com/microsoft/vscode/issues/150466). 
- TL;DR, the setting in question is ``terminal.integrated.minimumContrastRatio``.
