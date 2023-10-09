<h2>Introduction</h2>
<br>Robot Framework with Python for UI Automation

<b>Pre-Requisite</b>
1. Install Python
2. Install Pycharm IDE 
3. Install Selenium 
4. Install RobotFramework 
5. Install RobotFramework-SeleniumLibrary

<b>To run test</b>
1. Prod = robot -d resources -v environment:prod tests/
2. Staging = robot -d resources -v environment:staging tests/ 
3. Specific file = robot -d resources -v environment:prod tests/login.robot
4. Specific tag = robot -d resources -v environment:prod --include=signup tests/

<b>To see result local</b>
1.  Go to /results
2.  Click report.html

<b>Scheduler using jenkins on local</b>
<br> Use this config

<b>Build Trigger</b>
<br> TZ=Etc/GMT+8 
<br> 0 9 * * *

<b>Execute Shell</b>
1. cd /your/paths/automation/folder 
2. /your/paths/robot -d resources -v environment:prod tests/
