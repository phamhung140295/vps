var macro;
var retcode;

macro = "CODE:";
macro += "PROMPT \"Email :\" !VAR1\n";
macro += "PROMPT \"PASS :\" !VAR2\n";
macro += "PROMPT \"Mail khoi phuc :\" !VAR3\n";
macro += "SET !EXTRACT {{!VAR1}}|-|{{!VAR2}}|-|{{!VAR3}}\n";
iimPlay(macro);
var gmail_input = iimGetLastExtract().split('|-|')[0];
var pass = iimGetLastExtract().split('|-|')[1];
var recoves_mail_input = iimGetLastExtract().split('|-|')[2];


changepass(gmail_input,pass);

clear_devices();
clear_devices();
clear_devices();
clear_devices();
clear_devices();

iimPlay(Enable_moz.iim);





function changepass(gmail_input,pass)
{
	iimSet("pass",pass);
macro = "CODE:";
macro += "SET !ERRORIGNORE YES\n";
macro += "SET !REPLAYSPEED fast\n";
macro += "SET !EXTRACT_TEST_POPUP NO\n";
macro += "URL GOTO=https://myaccount.google.com/signinoptions/password?utm_source=google-account&utm_medium=web&continue=https%3A%2F%2Fmyaccount.google.com%2Fpersonal-info\n";
macro += "WAIT SECONDS=0.1\n";
macro += "WAIT SECONDS=0.1\n";
macro += "WAIT SECONDS=2\n";
macro += "EVENT TYPE=CLICK SELECTOR=\"#forgotPassword>CONTENT>SPAN\" BUTTON=0\n";
macro += "WAIT SECONDS=10\n";
macro += "SET !ENCRYPTION NO\n";
macro += "EVENT TYPE=CLICK SELECTOR=\"#password>DIV>DIV>DIV>INPUT\" BUTTON=0\n";
macro += "WAIT SECONDS=5\n";
macro += "EVENTS TYPE=KEYPRESS SELECTOR=\"#password>DIV>DIV>DIV>INPUT\" CHARS={{pass}}\n";
macro += "WAIT SECONDS=5\n";
macro += "EVENT TYPE=CLICK SELECTOR=\"#passwordNext>CONTENT\" BUTTON=0\n";
macro += "WAIT SECONDS=5\n";
macro += "TAG POS=1 TYPE=INPUT:PASSWORD FORM=NAME:NoFormName ATTR=NAME:password CONTENT=h14563258!\n";
macro += "WAIT SECONDS=2\n";
macro += "TAG POS=1 TYPE=INPUT:PASSWORD FORM=NAME:NoFormName ATTR=NAME:confirmation_password CONTENT=h14563258!\n";
macro += "SET !EXTRACT {{!URLCURRENT}}\n";
macro += "WAIT SECONDS=0.5\n";
macro += "TAG POS=1 TYPE=DIV ATTR=CLASS:ZFr60d<SP>CeoRYc&&TXT:\n";
macro += "WAIT SECONDS=2\n";
iimPlay(macro);
var href = iimGetLastExtract();
href = href.substr(href.lastIndexOf('&rapt=')+6);

iimSet("rapt",href);
var recove_mail = gmail_input.split('@')[0] + "@yahoo.com";
iimSet("recove_mail",recove_mail);
macro = "CODE:";
macro += "SET !ERRORIGNORE YES\n";
macro += "SET !REPLAYSPEED fast\n";
macro += "SET !EXTRACT_TEST_POPUP NO\n";
macro += "URL GOTO=https://myaccount.google.com/recovery/email?continue=https://myaccount.google.com/email&rapt={{rapt}}\n";
macro += "WAIT SECONDS=0.1\n";
macro += "WAIT SECONDS =2\n";
macro += "TAG POS=1 TYPE=SPAN ATTR=CLASS:DPvwYc<SP>UWxmNc\n";
macro += "WAIT SECONDS=2\n";
macro += "TAG POS=1 TYPE=INPUT:EMAIL ATTR=* CONTENT={{recove_mail}}\n";
macro += "WAIT SECONDS=2\n";
macro += "TAG POS=3 TYPE=SPAN ATTR=CLASS:RveJvd<SP>snByac\n";
macro += "WAIT SECONDS=5\n";
macro += "URL GOTO=https://myaccount.google.com/alternateemail?continue=https://myaccount.google.com/email&rapt={{rapt}}\n";
macro += "WAIT SECONDS=0.1\n";
macro += "WAIT SECONDS=2\n";
macro += "TAG POS=1 TYPE=DIV ATTR=CLASS:lUavyb<sp>DPvwYc\n";
macro += "WAIT SECONDS=2\n";
iimPlay(macro);
}




function clear_devices()
{
macro = "CODE:";
macro += "SET !ERRORIGNORE YES\n";
macro += "SET !REPLAYSPEED fast\n";
macro += "SET !EXTRACT_TEST_POPUP NO\n";
macro += "URL GOTO=https://myaccount.google.com/device-activity?utm_source=google-account&utm_medium=web&pageId=none\n";
macro += "WAIT SECONDS=0.1\n";
macro += "WAIT SECONDS=0.1\n";
macro += "WAIT SECONDS=0.1\n";
macro += "SET !TIMEOUT 10\n";
macro += "TAG POS=2 TYPE=DIV ATTR=CLASS:URz83d<sp>WRlqaf\n";
macro += "TAG POS=3 TYPE=DIV ATTR=CLASS:URz83d<sp>WRlqaf\n";
macro += "TAG POS=4 TYPE=DIV ATTR=CLASS:URz83d<sp>WRlqaf\n";
macro += "TAG POS=5 TYPE=DIV ATTR=CLASS:URz83d<sp>WRlqaf\n";
macro += "TAG POS=6 TYPE=DIV ATTR=CLASS:URz83d<sp>WRlqaf\n";
macro += "WAIT SECONDS=0.5\n";
macro += "TAG POS=1 TYPE=DIV ATTR=CLASS:U26fgb<sp>O0WRkf<sp>oG5Srb<sp>HQ8yf<sp>C0oVfc<sp>nsoPhc\n";
macro += "WAIT SECONDS=2\n";
macro += "EVENT TYPE=CLICK SELECTOR=\"#yDmH0d>DIV:nth-of-type(10)>DIV>DIV:nth-of-type(2)>DIV:nth-of-type(3)>DIV:nth-of-type(2)>CONTENT>SPAN\" BUTTON=0\n";
macro += "WAIT SECONDS=3\n";
iimPlay(macro);
}