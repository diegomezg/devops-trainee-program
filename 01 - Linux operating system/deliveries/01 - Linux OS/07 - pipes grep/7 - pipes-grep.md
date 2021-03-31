# PIPES & grep in Linux
* What is a pipe and how does it work?  
The pipe will allow us to connect the execution of programs, passing the output of one as the input of another. Executes a filter or instruction within the main command
* Explain how grep works and present an example  
```
history | grep "rm"
```
The command 'history' will execute but using a grep (Global Regular Expression Print) so insted of showing all history commands, it only will show commands where rm had been used
* Explain how egrep works and present an example  
```
egrep 'word' 'file'
egrep hello hello-world.js
console.log( _hello_ world )
```
Used mainly due to the fact that it is faster than the grep command. The egrep command treats the meta-characters as they are and do not require to be escaped as is the case with grep
* Present an example where you combine a pipe with grep and other command
* Present an example where you combine a pipe with egrep and other command