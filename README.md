# Bash Script Toolbox

A modular command-line toolbox for managing Bash scripts efficiently.

---

## Features

- Create new executable Bash scripts
- Debug scripts using `bash -x`
- List scripts in current directory
- Run scripts safely
- Edit scripts (vim / nano)
- Backup files or directories (timestamped)
- Delete scripts with confirmation

---

## Requirements

- Bash 4+
- GNU core utilities (cp, rm, ls, chmod)
- vim or nano (optional for editing)

---

## Installation

Clone the repository:

```bash
git clone https://github.com/kencal20/bash-script-toolkit.git
cd bash-script-toolbox
chmod +x *.sh

--- 

To use the toolbox as a system-wide command:

sudo cp script_toolbox.sh /usr/local/bin/script-toolbox
sudo chmod a+x /usr/local/bin/script-toolbox

Now you can run it from anywhere:

script-toolbox
