# Unix Shell Scripting

## Checking Files

### Instructions

1. Create the script file with the proper name
2. Make sure first line contains the ``shebang`` character followed by the absolute path to the bash executable binary
3. Describe program purpose using a bash comment
4. Declare variables
5. Work with conditionals ``if`` and ``else``
6. Set up exit codes
7. Work with parameters
8. Redirect the files content to a new text file sorting it alphabetically
9. Show a prompt ``if`` the script ran successfully or not

### Expected deliverables

Script must evaluate ``if`` at the moment you run it you pass 2 files as parameters considering the following:

- If user doesn't pass any file, show a prompt "No files given" and finish with a 65 exit code
- If number of files provided exceed 2, show a prompt "The script (script name) must contain 2 files, for example: file1.txt file2.txt"
  and finish with a 85 exit code
- If the given files don't exist, show a prompt "File XXXYYY does not exist" and finish with a 87 exit code
- If files are empty, display a message saying "Files are 0 size" and finish with a 89 exit code
- If files have some data, create a new text file adding all the information from both files and sorting it
  alphabetically and showing a prompt "Execution of the script <script-name> was successful"

### Evaluation

| Metric Name  | Description                                         | % Value |
| ------------ | --------------------------------------------------- | ------- |
| Quality      | Script is easy readable                             | 20      |
| Instructions | Instructions are included as comments in the script | 40      |
| Deliverable  | Script is working properly and requirements are met | 40      |
