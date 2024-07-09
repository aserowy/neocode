#!/usr/bin/env nu

def main [action: string] {
    if $action == 'link' {
        link_neocode
    } else if $action == 'unlink' {
        unlink_neocode
    }
}

def link_neocode [] {
    mv --force ~/.config/nvim/ ~/.config/nvim_unlinked
    (ln -s $env.PWD ~/.config/nvim)
}

def unlink_neocode [] {
    (unlink ~/.config/nvim)
    mv --force ~/.config/nvim_unlinked/ ~/.config/nvim/
}

