# How to: Change / Setup bash custom prompt (PS1)

Prompt is control via a special shell variable. You need to set PS1, PS2, PS3 and PS4 variable. If set, the value is executed as a command prior to issuing each primary prompt.

* PS1 - The value of this parameter is expanded (see PROMPTING below) and used as the primary prompt string. The default value is `\s-\v\$`.
* PS2 - The value of this parameter is expanded as with PS1 and used as the secondary prompt string. The default is >
* PS3 - The value of this parameter is used as the prompt for the select command
* PS4 - The value of this parameter is expanded as with PS1 and the value is printed before each command bash displays during an execution trace. The first character of PS4 is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is `+`

To display current prompt setting use echo command:

```
$ echo $PS1
```

To modify or change the prompt just assign a new value to PS1 and hit enter key:

```
PS1="touch me : "
```

So when executing interactively, bash displays the primary prompt PS1 when it is ready to read a command, and the secondary prompt PS2 when it needs more input to complete a command. Bash allows these prompt strings to be customized by inserting a number of backslash-escaped special characters that are decoded as follows:

\a : an ASCII bell character (07)  
\d : the date in "Weekday Month Date" format (e.g., "Tue May 26")  
\D{format} :    the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required  
\e : an ASCII escape character (033)  
\h : the hostname up to the first '.'  
\H : the hostname   
\j : the number of jobs currently managed by the shell  
\l : the basename of the shell's terminal device name  
\n : newline  
\r : carriage return  
\s : the name of the shell, the basename of $0 (the portion following the final slash)  
\t : the current time in 24-hour HH:MM:SS format  
\T : the current time in 12-hour HH:MM:SS format  
\@ : the current time in 12-hour am/pm format  
\A : the current time in 24-hour HH:MM format  
\u : the username of the current user  
\v : the version of bash (e.g., 2.00)  
\V : the release of bash, version + patch level (e.g., 2.00.0)  
\w : the current working directory, with $HOME abbreviated with a tilde  
\W : the basename of the current working directory, with $HOME abbreviated with a tilde  
\\! : the history number of this command  
\\# : the command number of this command  
\$ : if the effective UID is 0, a #, otherwise a $  
\nnn : the character corresponding to the octal number nnn  
\\\ : a backslash  
\\[ : begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt  
\\] : end a sequence of non-printing characters  

## How do I add colors to my prompt?

Let us say when you login as root/superuser, you want to get visual confirmation using red color prompt. To distinguish between superuser and normal user you use last character in the prompt, if it changes from $ to #, you have superuser privileges. So let us set your prompt color to RED when you login as root, otherwise display normal prompt.

Open `/etc/bashrc` (Redhat and friends) / or `/etc/bash.bashrc` (Debian/Ubuntu) or `/etc/bash.bashrc.local` (Suse and others) file and append following code:


```
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  PS1="[\\u@\\h:\\w] $"
fi
```

