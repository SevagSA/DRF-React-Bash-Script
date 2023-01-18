# A bash script to generate a DRF/React project.
Currently (V1.1): 
- Creates two folders (backend and frontend)


- In backend (Django/DRF):
  - Creates venv
  - Installs user specified version of Django w/user-specified project name and latest version of DRF
  - Creates .env, .env.template, .gitignore, requirements.txt files


- In frontend (React):
  - Creates React app in current folder (.)


Next step(s):
- Generate a sk in .env
- Ask user if they want to use a custom DB (will be PostgreSQL)
- Try to replace the values in settings.py by env('NAME_OF_VALUE') for the variables that will be set as env variables (sk, debug, etc.)
- Push to git as the 'init' commit (only if able to do the step above)
- and more...
