# rct.vim

The vim plugin that wraps the [rct](github.com/jcocozza/rtc) tool.

Here is the basic problem that this plugin aims to solve:

When working in vim, occasionally one wants to copy text directly to the system clipboard.
This is usually done via `:"+y` or `:"*y` -- yanking into the buffer corresponding to the system clipboard.
This becomes problematic when working with vim on a remote machine.
Yanking into the system clipboard doesn't do anything useful because the your local machine does not have access the remote's clipboard.
There are (of course) workarounds like X11 forwarding, but I've found that these are often frustrating to work with and can be finicky.

My solution was to develop a basic cross platform tool, [rct](github.com/jcocozza/rtc), that sends text between machines.
This plugin is a wrapper around it.

The idea is to reproduce the behavior of `:"+y` or `:"*y` except from remote to local.
