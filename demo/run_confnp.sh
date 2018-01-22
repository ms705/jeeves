#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${dir}/..

virtualenv -p python2 --no-site-packages env
source env/bin/activate
pip install -r requirements.txt

# initialize DB
python demo/confnp/manage.py syncdb

# run server
python demo/confnp/manage.py runserver 0.0.0.0:8000
