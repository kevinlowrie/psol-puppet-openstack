# Remainder of nodes follow
vagrant ssh network -c "sudo puppet agent -t" &
vagrant ssh storage -c "sudo puppet agent -t" &
vagrant ssh compute1 -c "sudo puppet agent -t" &

wait
