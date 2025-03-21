hyprctl dispatch -- exec kitty --hold cmus
# For wttr.in codes, see: https://wttr.in/:help
hyprctl dispatch -- exec kitty --hold curl --silent wttr.in/York?1nq
hyprctl dispatch -- exec kitty --hold vim ~/docs/todos/todo
sleep 0.2
hyprctl dispatch resizeactive 200 0
