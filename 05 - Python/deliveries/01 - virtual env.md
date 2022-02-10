# Python Environment (Virtualenv)
Install virtual env package
```
apt-get install python3-venv
```
Create virtual env
```
# Specify python version for better control
python3 -m venv envNumberOne
python3 -m venv envNumberTwo
```
Activate first env
```
source bin/activate
```
Install new package
```
pip install Flask
```
 Freeze local packages installed on virtual environment in .txt file
```
pip freeze --l > requirements.txt
```
Move it to the other env
```
cp requirements.txt ../envNumberTwo/
```
Deactivate env
```
deactivate
```
Activate second env
```
source bin/activate
```
Use requirements.txt to install all dependencies in a python project
```
pip3 install -r requirements.txt
```  

What would be the difference of doing this vs using a docker container, and what could be the limitations?
Python environment works on your local machine and has easily tools to manage python packages, docker instead its running in and isolated space so you should change constantly so those environment variables or configurations and you can manage full OS tools or software