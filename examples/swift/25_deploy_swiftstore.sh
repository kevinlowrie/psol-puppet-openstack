
#!/bin/bash

# Kick off the puppet runs, control is first for databases
vagrant ssh swiftstore1 -c "sudo service firewalld stop; sudo puppet agent -t"
vagrant ssh swiftstore2 -c "sudo service firewalld stop; sudo puppet agent -t"
vagrant ssh swiftstore3 -c "sudo service firewalld stop; sudo puppet agent -t"
