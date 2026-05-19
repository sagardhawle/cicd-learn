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
  animation:bgchange 8s infinite;
}
h1{font-size:60px;}
h2{font-size:30px;}
p{font-size:20px;}
@keyframes bgchange{
  0%{background:#ff6b6b;}
  25%{background:#4ecdc4;}
  50%{background:#1a535c;}
  75%{background:#ff9f1c;}
  100%{background:#6a4c93;}
}
</style>
</head>
<body>
<h1>Hello Sagar! 🚀</h1>
<h2>Welcome To CI/CD World!</h2>
<p>Version 2 - Updated Automatically! ✅</p>
</body>
</html>
HTMLEOF
systemctl restart httpd