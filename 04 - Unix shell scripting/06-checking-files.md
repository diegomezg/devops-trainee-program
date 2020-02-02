# Unix Shell Scripting
### Checking Files
------------
##### Instructions
1.  Create the script file with the proper name
2.  Make sure your script is built with the Shebang interpreter
3.  Write a comment within the script
4.  Declare variables
5.  Work with conditionals if and else
6.  Set up exit codes
7.  Work with parameters
8.  Redirect the files content to a new text file sorting it alphabetically
9.  Show a prompt if the script ran successfully or not
##### Expected deliverables
Script must evaluate if at the moment you run it you pass 2 files as parameters considering the following:
- If you did not pass any of those 2 files required show a prompt "No files given" and set up a 65 exit code
- Did you pass to the script exactly 2 files? If not, show a prompt "The script (script name) must contain 2 files, for example: file1.txt file2.txt" and set up a 85 exit code
- Do the files that you passed exists? If not, show a prompt "File XXXYYY does not exist" and set up a 87 exit code
- Do the files have data inside of them? If not, display a message saying "Files are 0 size" and set up a 89 exit code
- Did you pass to the script 2 files with data inside them? If so, create a new text file adding all the information that contain both files sorting it alphabetically and showing a prompt "Execution of the script (script name) was successful"
##### Evaluation
| Metric Name  | Description  | % Vaue  |
| ------------ | ------------ | ------------ |
|  Quality | Script is easy readable |  20 |
|  Instructions | Comments instructions are included within the script  |  40 |
| Deliverable  | Script is working properly and requirements are met|  40 |
