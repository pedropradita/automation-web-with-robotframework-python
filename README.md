<h2>Introduction</h2>
<br>Robot Framework with Python for UI Automation

<h3><b>Pre-Requisite</b></h3>
1. Install Python
2. Install Pycharm IDE 
3. Install Selenium 
4. Install RobotFramework 
5. Install RobotFramework-SeleniumLibrary

<h3><b>To run test</b></h3>
1. Prod = robot -d resources -v environment:prod tests/
2. Staging = robot -d resources -v environment:staging tests/ 
3. Specific file = robot -d resources -v environment:prod tests/login.robot
4. Specific tag = robot -d resources -v environment:prod --include=signup tests/

<h3><b>To see result local</b></h3>
1.  Go to /results
2.  Click report.html

<h3><b>Scheduler using jenkins on local</b></h3>
<br> Use this config

<h3><b>Build Trigger</b></h3>
<br> TZ=Etc/GMT+8 
<br> 0 9 * * *

<h3><b>Execute Shell</b></h3>
1. cd /your/paths/automation/folder 
2. /your/paths/robot -d resources -v environment:prod tests/
