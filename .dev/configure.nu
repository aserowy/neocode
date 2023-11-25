#!/usr/bin/env nu

def main [action: string] {
    if $action == 'link' {
        link_neocode
    } else if $action == 'unlink' {
        unlink_neocode
    }
}

def link_neocode [] {
    mv --force ~/.config/nvim/ ~/.config/nvim_unlinked/
    run-external --redirect-stderr "ln" "-s" $env.PWD "~/.config/nvim"
}

def unlink_neocode [] {
    run-external --redirect-stderr "unlink" "~/.config/nvim"
    mv --force ~/.config/nvim_unlinked/ ~/.config/nvim/
}

