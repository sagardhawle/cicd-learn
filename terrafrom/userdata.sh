#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
cat > /var/www/html/index.html << 'HTMLEOF'
<!DOCTYPE html>
<html>
<head>
<title>Hello Sagar</title>
<style>
body{
  font-family:Arial;
  text-align:center;
  padding:50px;
  background:#1a1a2e;
  color:white;
}
h1{font-size:60px;}
h2{font-size:30px;}
</style>
</head>
<body>
<h1>Hello Sagar! 🚀</h1>
<h2>My Website is Live!</h2>
<p>Deployed with GitHub Actions! ✅</p>
</body>
</html>
HTMLEOF
systemctl restart httpd