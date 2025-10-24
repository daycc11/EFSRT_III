<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<style>
.social-bar {
  position: fixed;
  top: 40%;
  left: 0;
  transform: translateY(-50%);
  display: flex;
  flex-direction: column;
  z-index: 1000;
}

.social-bar a {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 45px;
  height: 45px;
  margin: 5px 0;
  color: white;
  text-decoration: none;
  font-size: 20px;
  border-radius: 0 10px 10px 0;
  transition: 0.3s;
}

.icon-x { background: #000; }
.icon-instagram { background: linear-gradient(45deg, #f9ce34, #ee2a7b, #6228d7); }
.icon-tiktok { background: #010101; }
.icon-whatsapp { background: #25D366; }
.icon-facebook { background: #1877F2; }

.social-bar a:hover {
  transform: translateX(10px);
  opacity: 0.9;
}
</style>
<body>
<div class="social-bar">
  <a href="https://x.com/" target="_blank" class="icon icon-x"><i class="fa-brands fa-x-twitter"></i></a>
  <a href="https://www.instagram.com/" target="_blank" class="icon icon-instagram"><i class="fa-brands fa-instagram"></i></a>
  <a href="https://www.tiktok.com/" target="_blank" class="icon icon-tiktok"><i class="fa-brands fa-tiktok"></i></a>
  <a href="https://wa.me/51900000000" target="_blank" class="icon icon-whatsapp"><i class="fa-brands fa-whatsapp"></i></a>
  <a href="https://www.facebook.com/" target="_blank" class="icon icon-facebook"><i class="fa-brands fa-facebook-f"></i></a>
</div>
</body>
</html>