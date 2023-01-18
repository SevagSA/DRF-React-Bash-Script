cat <<EOF >.gitignore
.DS_Store
EOF
echo 'Which version of Django do you want: '
read django_version
mkdir backend && mkdir frontend && cd backend && python3 -m venv ./env && source env/bin/activate && pip install django==$django_version && pip install djangorestframework && pip install django-environ && pip freeze > requirements.txt
echo 'Enter Django project name: '
read django_proj_name
django-admin startproject $django_proj_name .
cat <<EOF >.gitignore
__pycache__/
*.py[cod]
*$py.class

*.so

.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

*.manifest
*.spec

pip-log.txt
pip-delete-this-directory.txt

htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/

*.mo
*.pot

*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

instance/
.webassets-cache

.scrapy

docs/_build/

.pybuilder/
target/

.ipynb_checkpoints

profile_default/
ipython_config.py

.pdm.toml

__pypackages__/

celerybeat-schedule
celerybeat.pid

*.sage.py

.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

.spyderproject
.spyproject

.ropeproject

/site

.mypy_cache/
.dmypy.json
dmypy.json

.pyre/
.pytype/
cython_debug/
.DS_Store
EOF
./manage.py migrate
cd $django_proj_name
cat <<EOF >.env.template
SK=secretkey
DEBUG=debug_boolean
EOF
cat <<EOF >.env
SK=
DEBUG=True
EOF
cd ../../frontend
npx create-react-app .
# Removing unwanted React files
rm -rf readme.md && cd public && rm -rf logo192.png logo512.png favicon.ico && cd ../src && rm -rf App.css index.css App.test.js reportWebVitals.js setupTests.js logo.svg
