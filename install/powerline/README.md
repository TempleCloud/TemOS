# Powerline Fonts

## Installation

1. Pick one of the install scripts for the target OS and read through them.

2. The manual process will install them from: [Powerline Fonts](https://github.com/powerline/fonts) github repository.

---

## Configuring `nix` Systems

1. Fonts can be configured using the __fontconfig__: `~/.config/fontconfig/conf.d` 

2. The font cache can be flushed using the `fc-cache -vf` command.

---

## Configure Terminal

1. Configure your terminal program to use an installed `powerline` based font, e.g. `Meslo`.

    * `Meslo LG S DZ for Powerline Regular`

--- 

# Configure Vim

1. Configure Vim to use the powerline fonts when required  in `/.vimrc`.

    ```vim
    if has("gui_running")
       let s:uname = system("uname")
       if s:uname == "Darwin\n"
          set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h12
       endif
    endif
    ```

2. Configure Vim to enable powerline fonts.

    ```vim
    call minpac#add('vim-airline/vim-airline')
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    call minpac#add('vim-airline/vim-airline-themes')
    let g:airline_theme = 'molokai'
    ```

---

## Configure Chrome (for Electron based applications).

1. Update Configuration

    ```
    "terminal.integrated.fontFamily": "Meslo LG M DZ for Powerline"
    ```

