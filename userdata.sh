#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
cat > /var/www/html/index.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hello Sagar</title>
<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:Arial,sans-serif;}
body{height:100vh;display:flex;flex-direction:column;justify-content:center;align-items:center;text-align:center;color:white;animation:bgchange 8s infinite;}
h1{font-size:60px;margin-bottom:10px;text-shadow:2px 2px 5px black;}
h2{margin-bottom:40px;font-size:30px;}
.logo-container{display:flex;gap:30px;flex-wrap:wrap;justify-content:center;}
.logo-card{width:150px;background:rgba(255,255,255,0.15);padding:20px;border-radius:20px;backdrop-filter:blur(5px);transition:0.3s;}
.logo-card:hover{transform:scale(1.1);}
.logo-card img{width:100px;height:100px;object-fit:contain;background:white;border-radius:15px;padding:10px;}
.logo-card p{margin-top:10px;font-size:20px;font-weight:bold;}
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
<h2>Welcome To CI/CD World</h2>
<div class="logo-container">
<div class="logo-card">
<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png">
<p>GitHub</p>
</div>
<div class="logo-card">
<img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg">
<p>AWS</p>
</div>
<div class="logo-card">
<img src="https://www.vectorlogo.zone/logos/terraformio/terraformio-icon.svg">
<p>Terraform</p>
</div>
<div class="logo-card">
<img src="https://cdn-icons-png.flaticon.com/512/919/919853.png">
<p>CI/CD</p>
</div>
</div>
</body>
</html>
HTMLEOF
systemctl restart httpd