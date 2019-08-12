pipVersion=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
pip3="pip$pipVersion"

$pip3 install virtualenv virtualenvwrapper
