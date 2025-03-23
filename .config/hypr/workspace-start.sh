hyprctl dispatch -- exec kitty --hold cmus
sleep 0.2
# For wttr.in codes, see: https://wttr.in/:help
hyprctl dispatch -- exec kitty --hold curl --silent wttr.in/York?1nq
sleep 0.2
hyprctl dispatch -- exec kitty --hold less ~/docs/todos/todo
sleep 0.3
hyprctl dispatch resizeactive 200 -80
