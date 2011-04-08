::Max Franks - 2011
::batch cmd for google

::Usage: google [-b][-cdrive][-n][-url][-s][-mail][-maps][-dev][-code][-home] Args...
::
::google -b         Opens a blank web page (about:blank)
::google -cdrive    Opens the browser to your C:\ Drive
::google -n         Opens a new window
::google -s         Navigates to Google.com (-s for search)
::google -home      Also, navigates to Google.com
::google -mail      Navigates to GMail
::google -maps      Navigates to Google Maps
::google -dev       Navigates to Google Developer
::google -code      Navigates to Google Code
::
::google -url "twitter.com"
::                  Opens a browser to the url supplied
::
::google "multiline grep" "perl 6" perlmonks                  
::      This would open 3 new tabs in chrome.
::      Showing the search results for 'multiline grep', 'perl 6' and 'perlmonks'.
::      Meaning that quotes are needed for multi-word searches.

::Turns off echo
@ECHO OFF

::start local variables
setlocal
set /A argCount=0

::Loops through args
:Loop

::Conditional args
IF "%~1"=="" GOTO END

::adds one to variable count
SET /A argCount=%argCount%+1

IF "%~1"=="-h" GOTO HOWTO
IF "%~1"=="-b" GOTO Blank
IF "%~1"=="-s" GOTO Search
IF "%~1"=="-home" GOTO Search
IF "%~1"=="-cdrive" GOTO CDrive
IF "%~1"=="-n" GOTO NewWindow
IF "%~1"=="-mail" GOTO GMail
IF "%~1"=="-maps" GOTO Maps
IF "%~1"=="-url" GOTO URL
IF "%~1"=="-u" GOTO URL
IF "%~1"=="-dev" GOTO Dev
IF "%~1"=="-code" GOTO Code

::checks to see if an arg was mistyped (begins with -)
::this must come after all other possible arguments
SET "arg=%~1"
SET isArg=%arg:~0,1%
IF %isArg% ==- (
    GOTO HOWTO
)

::Args to search terms
::successful search arg
echo %~1
start chrome.exe "http://www.google.com/search?q=%~1" chrome://newtab/

SHIFT
GOTO Loop

::======================
::      Options
::======================


::opens a blank tab
:Blank
start chrome.exe "about:blank" chrome://newtab/
goto END

::Opens a browser to your C drive
::Usually faster than opening a new windows explorer...
:CDrive
start chrome.exe "file:///C:/" chrome://newtab/
goto END

::opens a new window
:NewWindow
start chrome.exe
goto END

::opens google.com
:Search
start chrome.exe "google.com" chrome://newtab/
goto END

::opens gmails
:GMail
start chrome.exe "mail.google.com" chrome://newtab/
goto END

::opens google maps
:Maps
start chrome.exe "maps.google.com" chrome://newtab/
goto END

::opens a url
:URL

::removes -url from args
SHIFT
echo. %~1
start chrome.exe %~1
goto END

::goes to Android Developer Home
:Dev
start chrome.exe "market.android.com/publish/Home" chrome://newtab/
goto END

::goes to Google Code
:Code
start chrome.exe "code.google.com/hosting/" chrome://newtab/
goto END

::This prints out the instructions
:HOWTO

echo. Usage: google [-b][-cdrive][-n][-url][-s][-mail][-maps][-dev][-code] Args...
echo. 
echo. google -b         Opens a blank web page (about:blank)
echo. google -cdrive    Opens the browser to your C:\ Drive
echo. google -n         Opens a new window
echo. google -s         Navigates to Google.com (-s - search)
echo. google -home      Also, navigates to Google.com
echo. google -mail      Navigates to GMail
echo. google -maps      Navigates to Google Maps
echo. google -dev       Navigates to Google Developer
echo. google -code      Navigates to Google Code
echo. 
echo. google -url "twitter.com"
echo.                   Opens a browser to the url supplied
echo. 
echo. google "multiline grep" "perl 6" perlmonks                  
echo.       This would open 3 new tabs in chrome.
echo.       Showing the search results for 'multiline grep', 'perl 6' and 'perlmonks'.
echo.       Meaning that quotes are needed for multi-word searches.

goto END

::This is the end...
:END

::if there are no args, print howto
IF %argCount%==0 (
    SET /A argCount=%argCount%+1
    goto HOWTO
)

::end local variables
endlocal