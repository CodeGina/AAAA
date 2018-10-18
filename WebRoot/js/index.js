    function my$(id){
    	return document.getElementById(id);
    }
    
	//校验用户性别是否已选
	function checkGender(){
		var genderNum = document.getElementsByName("gender");
		var gender = "";
		for(var i=0;i<genderNum.length;i++){
			if(genderNum[i].checked){
				gender = genderNum[i].value;
			}
		}
		if(gender == ""){
			my$("tips_gender").innerHTML = "<em>至少选择其中一项</em>";
			return false;
		}else {
			my$("tip_gender").innerHTML = "OK!";
		}
	}

	function checkUser(){
		if(my$("txtUser").value.length<6 || my$("txtUser").value.length>18){

			my$("tip_username").innerHTML = "<em>用户名由6-18位字符组成</em>";
			my$("txtUser").focus();
			return false;
		}else{
			my$("tip_username").innerHTML = "OK!";
		}
	}

	function checkPassword(){
		var reg = /[^A-Za-z0-9_]+/;
		var regs =/^[A-Za-z0-9_\u4e00-\u9fa5]+$/;

		if(my$("password").value.length<6 || my$("password").value.length>18 || regs.test(my$("password").value)){

			my$("tip_password").innerHTML = "<em>密码由6-18位字符组成,必须包含字母，数字和标点符号</em>";
			my$("password").focus();
			return false;
		}else{
			my$("tip_password").innerHTML = "OK!";
		}
	}


	function checkpwdrepeat(){
		// 校验两次密码
		if(my$("pwdrepeat").value != my$("password").value){
			my$("tip_pwdrepeat").innerHTML = "<em>两次密码不一致</em>";
			my$("pwdrepeat").focus();
			return false;
		}else{
			my$("tip_pwdrepeat").innerHTML = "OK!";
		}
	}

	function checkUserType(){
		// 校验用户类别
		if(my$("usertype").selectedIndex == 0){

			my$("tip_usertype").innerHTML = "<em>没有选择用户类型</em>";
			my$("usertype").focus();
			return false;
		}else{
			my$("tip_usertype").innerHTML = "OK!";
		}
	}

	function checkBirthdy(){
		//校验出生日期
		if(my$("birthday").value == ""){
			my$("tip_birthday").innerHTML = "<em>没有太填写出生日期</em>";
			my$("birthday").focus();
			return false;
		}else{
			my$("tip_birthday").innerHTML = "OK!";
		}
	}


	function checkEmail(){
		// 校验email
		var email = my$("email").value;
		var pattern = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if(email.length == 0){
			my$("tip_email").innerHTML = "<em>Email不能为空</em>";
			my$("email").focus();
			return false;
		}else if(!pattern.test(email)){
			my$("tip_email").innerHTML = "<em>Email不合法</em>";
			my$("email").focus();
			return false;
		}else{
			my$("tip_email").innerHTML = "OK!";
		}
	}


	function checkIntroduction(){
		//校验自我介绍
		if(my$("introduction").value.length > 100){
			my$("tip_introduction").innerHTML = "<em>长度不能超过100个字</em>";
			my$("introduction").focus();
			return false;
		}else if(my$("introduction").value.length == 0){
			my$("tip_introduction").innerHTML = "<em>长度不能为0个字</em>";
			my$("introduction").focus();
			return false;
		}else{
			my$("tip_introduction").innerHTML = "OK!";
		}
	}


	//校验爱好是否合法
	function checkHobby(){
		var hobby = 0;
		var num = document.getElementsByName("hobby");
		for(var i=0;i<num.length;i++){
			if(num[i].checked == true)
				hobby++;
		}
		if(hobby >= 1){
			my$("tip_hobby").innerHTML = "OK!";
		}else{
			my$("tip_hobby").innerHTML = "<em>至少选择其中一项</em>";
			return false;
		}
	}
