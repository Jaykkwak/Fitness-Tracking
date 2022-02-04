<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page
	import="javax.servlet.http.Cookie, EasyFit_Model.User, EasyFit_Model.UserEntryDBHelper, EasyFit_Model.FitnessGoal, EasyFit_Model.FitnessGoalDBHelper"%>
	
<!DOCTYPE html>
<html>
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);
:root{
   --green: #6eb73a;
   --orange: #fac780;
   --background: #fcfcea;
}
* {
   box-sizing: border-box;
   margin: 0;
   padding: 0;
   font-family: 'Exo', sans-serif;
   scroll-behavior: smooth;
}
body{
 background-color:#FFC882;
 height: 100px;
}
.navbar{
   width: 100%;
   background: var(--orange);
   z-index: 999;
   top: 0;
   position: sticky;
}
.nav-container{
   display: grid;
   grid-template-columns: 1fr auto 2fr;
   align-items: center;
   justify-items: end;
   height: 80px;
   width: 70%;
   max-width: 1900px;
   margin: 0 auto;
}
.nav-logo{
   color: white;
   justify-self: start;
   font-size: 2.3rem;
   font-weight: 1000;
   cursor: pointer;
}
.nav-menu{
   display: grid;
   grid-template-columns: repeat(4, 130px);
   list-style: none;
   text-align: center;
   width: 70%;
   justify-content: end;
   z-index: 1;
}
.nav-links{
   font-size: 1.2rem;
   color: white;
   text-decoration: none;
}
.nav-links:hover{
   color: var(--green);
   transition: all 0.2 ease-out;
}
.nav-btn{
   background-color: var(--green);
   padding: 6px 20px;
   border-radius: 4px;
   font-weight: 600;
}
.nav-btn:hover{
   background-color: #aed093;
   color: white;
   padding: 5px 19px;
   border-radius: 4px;
   transition: all 0.3s ease-out;
}
.nav-toggle .bar{
   width: 25px;
   height: 3px;
   margin: 5px auto;
   transition: all 0.3s ease-in-out;
   background: white;
}

h1{
  color: white;
font-size: 100px;
font-family: 'Exo', sans-serif;
text-align: center;
}

svg{
  width: 400px;
  height:400px;
	margin-left: 470px;
	margin-bottom: 100px;
	position: center;
}

@media screen and (max-width: 768px) {
   .navbar{
       position: relative;
   }
   .nav-menu{
       display: grid;
       grid-template-columns: repeat(1, 100%);
       background: #e2c095;
       margin: 0;
       width: 100%;
       position: absolute;
       left: 0;
       top: -1000px;
       opacity: 0;
       z-index: 2;
   }
   #nav-logo{
       margin-left: 20px;
   }
   .nav-menu.active{
       background: #e2c095;
       justify-content: center;
       width: 100%;
       left: 0;
       top: 100%;
       opacity: 1;
   }
   .nav-links{
       text-align: center;
       line-height: 60px;
       width: 100%;
       display: table;
   }
   .nav-links:hover{
       background-color: #9ac57c;
       color: var(--white);
       width: 100%;
       transition: all 0.4s ease-out;
   }
   .nav-container{
       width: 90%;
   }
   .nav-btn{
       background: #e2c095;
       justify-content: center;
       width: 100%;
       left: 0;
       top: 100%;
       opacity: 1;
       transition: all 0.3s ease;
       z-index: 1;
   }
   #menu-toggle{
       position: absolute;
       top: 20%;
       right: 5%;
       transform: translate(5%, 20%);
   }
   .nav-toggle .bar{
       display: block;
       cursor: pointer;
   }
   .nav-toggle:hover{
       cursor: pointer;
   }
   #menu-toggle.is-active .bar:nth-child(2){
       opacity: 0;
   }
   #menu-toggle.is-active .bar:nth-child(1){
       transform: translatey(8px) rotate(45deg);
   }
   #menu-toggle.is-active .bar:nth-child(3){
       transform: translatey(-8px) rotate(-45deg);
   }
}

</style>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Signed-Out.css">
    <title>Loading Register</title>
<body>
	<% 
						String fname = request.getParameter("register-fname");
						String lname = request.getParameter("register-lname");
						String email = request.getParameter("register-email");
						String rusername = request.getParameter("register-username");
						String rpwd = request.getParameter("register-pwd");
						
						User ru = new User(rusername, rpwd, email, fname, lname);
						UserEntryDBHelper rudbhelp = new UserEntryDBHelper();
						boolean register = rudbhelp.addEntry(ru);
						if(register){
							System.out.println("Register.jsp: user created successfully");
						}

						
						String sHeight = request.getParameter("register-height");
						String sWeight = request.getParameter("register-weight");
						String sTargetWeight = request.getParameter("register-goal");
						String sTFrame = request.getParameter("register-tframe");
						
						System.out.println("Register.jsp: sHeight = " + sHeight);
						System.out.println("Register.jsp: sWeight = " + sWeight);
						System.out.println("Register.jsp: sTWeight = " + sTargetWeight);
						System.out.println("Register.jsp: sTFrame = " + sTFrame);
						
						int height = Integer.valueOf(sHeight);
						int weight = Integer.valueOf(sWeight);
						int targetWeight = Integer.valueOf(sTargetWeight);
						int tframe = Integer.valueOf(sTFrame);
						
						FitnessGoal fg = new FitnessGoal(height, weight, targetWeight, tframe);
						FitnessGoalDBHelper fgdbhelp = new FitnessGoalDBHelper();
						boolean regFG = fgdbhelp.addEntry(ru.getUserID(), fg);
						if(regFG){
							System.out.println("Register.jsp: fitness goal created successfully");
						}
						
						if(register && regFG){
								Cookie usernameC = new Cookie("username", rusername);
								Cookie passwordC = new Cookie("password", rpwd);
								Cookie useridC = new Cookie("id", ru.getUserID());
								Cookie emailC = new Cookie("email", ru.getEmail());
								Cookie fnameC = new Cookie("fname", ru.getfName());
								Cookie lnameC = new Cookie("lname", ru.getlName());

								usernameC.setMaxAge(60 * 60 * 24);
								passwordC.setMaxAge(60 * 60 * 24);
								useridC.setMaxAge(60 * 60 * 24);
								emailC.setMaxAge(60 * 60 * 24);
								fnameC.setMaxAge(60 * 60 * 24);
								lnameC.setMaxAge(60 * 60 * 24);

								System.out.println("Register.jsp: cookies created");

								response.addCookie(usernameC);
								response.addCookie(passwordC);
								response.addCookie(useridC);
								response.addCookie(emailC);
								response.addCookie(fnameC);
								response.addCookie(lnameC);

								System.out.println("Register.jsp: redirecting to dashboard");
								response.sendRedirect("UserDashboard.jsp");
						}
						else{
							System.out.println("Register.jsp: error creating account");
						}
					%>
    <!-- navbar -->
	<nav class="navbar">
		<div class="nav-container">
			<div class="nav-logo" onclick="landingpg()">EASY FIT</div>
			<div class="nav-toggle" id="menu-toggle">
				<span class="bar"></span> <span class="bar"></span> <span
					class="bar"></span>
			</div>
		</div>
	</nav>
	
	<!--nav scripts -->
	<script>
		function landingpg(){
			window.location="Home_SignedOut.jsp";
		}
	</script> 
	
    <h1>LOADING</h1>
    <svg width="377" height="411" viewBox="0 0 377 411" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_46_1795)">
<path d="M377 369.846C377 382.312 292.606 410.718 188.5 410.718C84.3943 410.718 0 382.312 0 369.846C0 357.381 84.3943 365.576 188.5 365.576C292.606 365.576 377 357.381 377 369.846Z" fill="white"/>
<path opacity="0.1" d="M377 369.846C377 382.312 292.606 410.718 188.5 410.718C84.3943 410.718 0 382.312 0 369.846C0 357.381 84.3943 365.576 188.5 365.576C292.606 365.576 377 357.381 377 369.846Z" fill="black"/>
<path d="M53.6829 203.917C58.0627 203.917 61.6133 200.367 61.6133 195.987C61.6133 191.607 58.0627 188.057 53.6829 188.057C49.303 188.057 45.7524 191.607 45.7524 195.987C45.7524 200.367 49.303 203.917 53.6829 203.917Z" fill="#B3D6A4"/>
<path d="M88.4548 269.191C92.8347 269.191 96.3853 265.64 96.3853 261.26C96.3853 256.881 92.8347 253.33 88.4548 253.33C84.075 253.33 80.5244 256.881 80.5244 261.26C80.5244 265.64 84.075 269.191 88.4548 269.191Z" fill="#B3D6A4"/>
<path d="M61.6133 252.72C65.9931 252.72 69.5437 249.17 69.5437 244.79C69.5437 240.41 65.9931 236.859 61.6133 236.859C57.2334 236.859 53.6829 240.41 53.6829 244.79C53.6829 249.17 57.2334 252.72 61.6133 252.72Z" fill="#B3D6A4"/>
<path d="M64.1427 357.354C64.0027 357.125 60.7017 351.613 59.5573 340.168C58.5076 329.668 59.1826 311.968 68.3616 287.279C85.7511 240.508 64.3541 202.77 64.1355 202.394L65.1911 201.781C65.2465 201.877 70.7678 211.498 74.0294 226.819C78.3391 247.132 76.7698 268.252 69.5054 287.705C52.1457 334.397 65.0517 356.5 65.184 356.718L64.1427 357.354Z" fill="#F4FFEF"/>
<path d="M57.3432 200.257C55.6541 200.257 54.0028 199.757 52.5984 198.818C51.1939 197.88 50.0992 196.546 49.4528 194.985C48.8064 193.425 48.6373 191.708 48.9668 190.051C49.2964 188.394 50.1098 186.872 51.3042 185.678C52.4986 184.484 54.0203 183.67 55.677 183.341C57.3337 183.011 59.0509 183.18 60.6115 183.827C62.172 184.473 63.5059 185.568 64.4443 186.972C65.3828 188.377 65.8836 190.028 65.8836 191.717C65.8811 193.981 64.9805 196.152 63.3794 197.753C61.7783 199.354 59.6075 200.255 57.3432 200.257V200.257ZM57.3432 184.397C55.8954 184.397 54.48 184.826 53.2762 185.63C52.0724 186.435 51.1341 187.578 50.58 188.916C50.026 190.253 49.881 191.725 50.1635 193.145C50.4459 194.565 51.1431 195.87 52.1669 196.893C53.1907 197.917 54.495 198.614 55.9151 198.897C57.3351 199.179 58.807 199.034 60.1446 198.48C61.4822 197.926 62.6255 196.988 63.4299 195.784C64.2342 194.58 64.6636 193.165 64.6636 191.717C64.6614 189.776 63.8894 187.915 62.517 186.543C61.1447 185.171 59.284 184.399 57.3432 184.397V184.397Z" fill="#F4FFEF"/>
<path d="M82.3543 228.929C86.7341 228.929 90.2847 225.378 90.2847 220.999C90.2847 216.619 86.7341 213.068 82.3543 213.068C77.9744 213.068 74.4238 216.619 74.4238 220.999C74.4238 225.378 77.9744 228.929 82.3543 228.929Z" fill="#F4FFEF"/>
<path d="M65.2733 249.06C63.5842 249.06 61.933 248.559 60.5285 247.621C59.1241 246.682 58.0294 245.348 57.383 243.788C56.7366 242.227 56.5675 240.51 56.897 238.853C57.2266 237.197 58.04 235.675 59.2344 234.48C60.4288 233.286 61.9505 232.473 63.6072 232.143C65.2639 231.814 66.9811 231.983 68.5417 232.629C70.1022 233.276 71.4361 234.37 72.3745 235.775C73.3129 237.179 73.8138 238.83 73.8138 240.519C73.8113 242.784 72.9107 244.955 71.3096 246.556C69.7085 248.157 67.5376 249.057 65.2733 249.06ZM65.2733 233.199C63.8255 233.199 62.4102 233.628 61.2064 234.433C60.0025 235.237 59.0643 236.38 58.5102 237.718C57.9561 239.056 57.8112 240.528 58.0936 241.948C58.3761 243.368 59.0733 244.672 60.0971 245.696C61.1208 246.72 62.4252 247.417 63.8452 247.699C65.2652 247.982 66.7371 247.837 68.0747 247.283C69.4124 246.729 70.5556 245.79 71.36 244.586C72.1644 243.383 72.5937 241.967 72.5937 240.519C72.5916 238.579 71.8196 236.718 70.4472 235.346C69.0749 233.973 67.2142 233.201 65.2733 233.199V233.199Z" fill="#F4FFEF"/>
<path d="M86.0146 265.531C84.3254 265.531 82.6742 265.03 81.2698 264.091C79.8653 263.153 78.7706 261.819 78.1242 260.258C77.4778 258.698 77.3087 256.981 77.6382 255.324C77.9678 253.667 78.7812 252.146 79.9756 250.951C81.17 249.757 82.6917 248.943 84.3484 248.614C86.0051 248.284 87.7223 248.453 89.2829 249.1C90.8434 249.746 92.1773 250.841 93.1157 252.245C94.0541 253.65 94.555 255.301 94.555 256.99C94.5525 259.254 93.6519 261.425 92.0508 263.026C90.4497 264.627 88.2789 265.528 86.0146 265.531V265.531ZM86.0146 249.67C84.5667 249.67 83.1514 250.099 81.9476 250.903C80.7438 251.708 79.8055 252.851 79.2514 254.189C78.6974 255.526 78.5524 256.998 78.8349 258.418C79.1173 259.838 79.8145 261.143 80.8383 262.166C81.8621 263.19 83.1664 263.887 84.5864 264.17C86.0065 264.452 87.4783 264.307 88.816 263.753C90.1536 263.199 91.2969 262.261 92.1013 261.057C92.9056 259.853 93.335 258.438 93.335 256.99C93.3328 255.049 92.5608 253.189 91.1885 251.816C89.8161 250.444 87.9554 249.672 86.0146 249.67Z" fill="#F4FFEF"/>
<path d="M59.1731 290.542C63.553 290.542 67.1035 286.992 67.1035 282.612C67.1035 278.232 63.553 274.681 59.1731 274.681C54.7932 274.681 51.2427 278.232 51.2427 282.612C51.2427 286.992 54.7932 290.542 59.1731 290.542Z" fill="#F4FFEF"/>
<path d="M68.9337 357.646C68.9337 357.646 61.0032 338.125 84.7945 323.484L68.9337 357.646Z" fill="#F4FFEF"/>
<path d="M59.1806 357.292C59.1806 357.292 55.5714 336.533 27.6367 336.71L59.1806 357.292Z" fill="#F4FFEF"/>
<path d="M345.484 364.966H210.5C210.5 364.966 207.764 324.836 223.953 324.38C240.142 323.924 238.318 342.165 258.611 317.083C278.904 292.002 303.53 293.37 306.722 308.191C309.914 323.012 300.566 334.868 317.667 331.22C334.768 327.572 359.393 337.148 345.484 364.966Z" fill="#B3D6A4"/>
<path d="M275.714 364.975L275.258 364.957C276.321 338.535 281.854 321.559 286.309 311.971C291.146 301.56 295.807 297.345 295.854 297.303L296.157 297.644C296.111 297.685 291.504 301.858 286.706 312.199C282.276 321.747 276.772 338.653 275.714 364.975Z" fill="white"/>
<path d="M324.568 365.03L324.13 364.902C329.402 346.809 341.815 335.385 341.94 335.271L342.247 335.609C342.123 335.721 329.802 347.064 324.568 365.03Z" fill="white"/>
<path d="M231.761 364.997L231.309 364.935C233.097 352.036 229.867 342.028 226.842 335.904C223.566 329.274 219.829 325.652 219.791 325.616L220.107 325.287C220.145 325.323 223.94 329.001 227.25 335.702C230.304 341.884 233.565 351.984 231.761 364.997Z" fill="white"/>
<path d="M363.804 365.576H195.941L195.902 365.008C195.805 363.593 193.664 330.226 204.475 318.321C206.892 315.659 209.804 314.262 213.129 314.169C220.176 313.968 224.604 316.608 228.176 318.727C234.909 322.721 239.357 325.36 255.528 305.372C273.047 283.719 291.949 279.061 302.815 281.651C309.836 283.325 314.675 288.056 316.091 294.631C317.432 300.857 317.005 306.707 316.662 311.408C316.295 316.438 316.005 320.41 318.07 322.211C319.795 323.713 323.237 323.849 328.901 322.64C340.424 320.182 356.501 322.286 364.571 332.712C368.913 338.322 372.333 348.518 363.973 365.239L363.804 365.576ZM197.086 364.356H363.049C369.279 351.717 369.473 341.039 363.606 333.459C356.203 323.894 340.672 321.377 329.156 323.834C323.001 325.147 319.334 324.93 317.269 323.13C314.743 320.93 315.053 316.689 315.445 311.319C315.783 306.696 316.203 300.943 314.899 294.888C313.586 288.791 309.078 284.399 302.533 282.838C292.013 280.328 273.639 284.928 256.477 306.139C239.643 326.946 234.571 323.939 227.554 319.776C223.938 317.631 219.832 315.199 213.163 315.388C210.183 315.472 207.564 316.735 205.379 319.141C195.662 329.841 196.848 359.845 197.086 364.356Z" fill="#F4FFEF"/>
<path d="M188.5 392.418C292.606 392.418 377 382.312 377 369.846C377 357.381 292.606 347.275 188.5 347.275C84.3943 347.275 0 357.381 0 369.846C0 382.312 84.3943 392.418 188.5 392.418Z" fill="white"/>
<path d="M192.645 74.5755C192.645 74.5755 183.221 71.2099 177.163 84.6724C171.105 98.1349 161.681 112.944 161.681 112.944L167.066 114.29C167.066 114.29 168.412 104.866 171.778 103.52L170.432 115.636C170.432 115.636 210.819 129.772 228.994 114.29L228.32 109.578C228.32 109.578 231.013 110.251 231.013 114.29L233.032 112.27C233.032 112.27 231.013 108.232 224.955 102.847C220.979 99.3122 219.612 92.5879 219.143 88.3838C218.791 84.8733 217.386 81.551 215.113 78.8528C211.087 74.187 203.751 69.2279 192.645 74.5755Z" fill="#3F4F38"/>
<path d="M182.705 127.359L172.944 115.158L165.624 90.1466L193.685 60.255C193.685 60.255 199.786 37.0738 194.295 38.2938C188.805 39.5139 187.585 56.5948 187.585 56.5948L152.203 84.0463C152.203 84.0463 155.863 122.478 166.234 135.899L174.164 160.91L182.705 127.359Z" fill="#FFB9B9"/>
<path d="M209.546 127.359L219.307 115.158L226.627 90.1466L198.566 60.255C198.566 60.255 192.465 37.0738 197.956 38.2938C203.446 39.5139 204.666 56.5948 204.666 56.5948L240.048 84.0463C240.048 84.0463 236.388 122.478 226.017 135.899L218.087 160.91L209.546 127.359Z" fill="#FFB9B9"/>
<path d="M196.125 116.988C204.885 116.988 211.986 109.887 211.986 101.127C211.986 92.3675 204.885 85.2664 196.125 85.2664C187.366 85.2664 180.265 92.3675 180.265 101.127C180.265 109.887 187.366 116.988 196.125 116.988Z" fill="#FFB9B9"/>
<path d="M188.805 109.667C188.805 109.667 189.415 122.478 185.755 126.748C182.095 131.019 178.434 152.98 196.125 153.59C213.816 154.2 211.986 135.289 211.986 135.289L208.326 124.918C208.326 124.918 202.836 116.988 204.666 109.667H188.805Z" fill="#FFB9B9"/>
<path d="M172.334 251.805L185.45 255.77C185.45 255.77 196.125 249.365 196.125 255.465C196.125 261.566 192.465 269.496 193.685 274.986C194.905 280.477 197.345 293.897 193.685 293.897C190.025 293.897 182.705 270.106 182.705 270.106L170.504 263.396L172.334 251.805Z" fill="#FFB9B9"/>
<path d="M188.805 337.21L183.925 356.121C183.925 356.121 179.655 361.611 183.925 364.051C185.929 365.196 187.395 367.55 188.387 369.726C189.252 371.686 190.699 373.332 192.532 374.441C194.365 375.55 196.495 376.068 198.632 375.924C200.714 375.751 202.468 374.928 202.895 372.789C203.013 372.118 202.99 371.429 202.827 370.767C202.665 370.105 202.366 369.485 201.95 368.945C197.45 362.864 196.43 358.866 196.43 358.866L198.261 337.515L188.805 337.21Z" fill="#FFB9B9"/>
<path d="M176.992 103.944C176.992 103.944 182.377 96.5395 187.089 95.1932C191.801 93.847 192.474 87.1157 192.474 87.1157C192.474 87.1157 204.591 100.578 211.995 101.251C219.399 101.924 212.668 85.0963 212.668 85.0963L199.206 81.7307L186.416 83.077L176.319 89.8082L176.992 103.944Z" fill="#3F4F38"/>
<path d="M166.844 205.442L164.404 210.323C164.404 210.323 105.231 229.234 110.111 246.925C114.991 264.616 142.443 259.735 142.443 259.735L172.944 265.226L175.994 251.805L154.643 246.315L191.245 232.894L192.465 295.117L187.585 339.65L199.786 340.87C199.786 340.87 213.206 299.998 211.376 282.917C211.376 282.917 233.947 213.373 221.137 203.002C208.326 192.632 166.844 205.442 166.844 205.442Z" fill="#3F4F38"/>
<path d="M196.841 135.297L187.322 123.793L180.875 126.748L174.164 148.099C174.164 148.099 168.674 158.47 175.384 169.451C175.384 169.451 176.604 176.771 174.774 178.601C172.944 180.431 172.334 192.022 172.334 192.022L164.404 207.273C164.404 207.273 209.546 215.203 222.967 204.222C222.967 204.222 215.925 178.259 220.195 170.328C224.465 162.398 225.075 150.24 220.195 144.75C215.314 139.26 210.156 124.918 210.156 124.918L207.202 123.029L196.841 135.297Z" fill="#F4FFEF"/>
<path d="M232.428 44.2179H226.577V38.3672H226.045V44.2179H220.195V44.7495H226.045V50.6002H226.577V44.7495H232.428V44.2179Z" fill="#F4FFEF"/>
<path d="M176.823 31.985H170.972V26.1343H170.441V31.985H164.59V32.5166H170.441V38.3673H170.972V32.5166H176.823V31.985Z" fill="#F4FFEF"/>
<path d="M203.513 5.85072H197.663V0H197.131V5.85072H191.28V6.38232H197.131V12.233H197.663V6.38232H203.513V5.85072Z" fill="#F4FFEF"/>
</g>
<defs>
<clipPath id="clip0_46_1795">
<rect width="377" height="410.718" fill="white"/>
</clipPath>
</defs>
</svg>



    <script>
        //navbar toggle
        const menu = document.querySelector('#menu-toggle');
        const menuLinks = document.querySelector('.nav-menu');

        menu.addEventListener('click', function (){
            menu.classList.toggle('is-active');
            menuLinks.classList.toggle('active');
        })
        </script>

</body>
