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
    run-external "ln" "-s" $env.PWD "~/.config/nvim" e>|
}

def unlink_neocode [] {
    run-external "unlink" "~/.config/nvim" e>|
    mv --force ~/.config/nvim_unlinked/ ~/.config/nvim
}

