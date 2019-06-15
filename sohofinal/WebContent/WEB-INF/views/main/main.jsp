<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>soho</title>
<style>/* The Modal (background) */
.modal {
  display: block; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 50%;
}
/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>
<!-- <body onload="go_pop()"> -->
<body>
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <table>
		<tr>
			<td>
				<img alt="" src="image/pop1.png" border="0"  style="width: 100%;">
			</td>
		</tr>
		<tr>
			<td align="center">
				<img alt="" src="image/coupon1.png" border="0"  style="width: 50%;">
				<img alt="" src="image/coupon2.png" border="0"  style="width: 50%;">
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" onclick="location.href='Ebbslist.do'"
				value="이벤트 바로가기"class="ebbsbutton" >
			</td>
		</tr>
	</table>
  </div>
</div>
<ul class="slides" style="width: 100%">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
         <div class="slide" style="width: 100%">
            <img src="image/mainv_1.png" style="width: 100%"/>
        </div>
        <div class="nav" style="width: 100%">
            <label for="img-5" class="prev">&#x2039;</label>
            <label for="img-2" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide" style="width: 100%">
          <img src="image/mainv_2.png" style="width: 100%"/>
        </div>
        <div class="nav" style="width: 100%">
            <label for="img-1" class="prev">&#x2039;</label>
            <label for="img-3" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide" style="width: 100%">
          <img src="image/mainv_3.png" style="width: 100%"/>
        </div>
        <div class="nav" style="width: 100%">
            <label for="img-2" class="prev">&#x2039;</label>
            <label for="img-4" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide" style="width: 100%">
          <img src="image/mainv_4.png" style="width: 100%"/>
        </div>
        <div class="nav" style="width: 100%">
            <label for="img-3" class="prev">&#x2039;</label>
            <label for="img-5" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide" style="width: 100%">
          <img src="image/mainv_5.png" style="width: 100%"/>
        </div>
        <div class="nav" style="width: 100%">
            <label for="img-4" class="prev">&#x2039;</label>
            <label for="img-1" class="next">&#x203a;</label>
        </div>
    </li>

   

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
    </li>
</ul>
<div align="center" style="width: 100%">
<img src="image/main_mid.png" style="width: 100%">
</div>
<div align="center" style="width: 100%">
<img src="image/mainbottom.png" style="width: 100%">
</div>

<script type="text/javascript">
 
//Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 


// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>
