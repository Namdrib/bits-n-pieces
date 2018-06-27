import pip
from subprocess import call

# Used to upgrade all existing pip packages
# https://stackoverflow.com/a/5839291

packages = [dist.project_name for dist in pip.get_installed_distributions()]
call("pip3 install --upgrade " + ' '.join(packages), shell=True)
