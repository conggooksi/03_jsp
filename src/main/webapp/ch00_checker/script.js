/**
 * script.js
 */
function isNull(obj, msg){
	if(obj.value==""){
		
		if(msg){
			alert(msg);
		}//if
		
		obj.focus();
		return true;//입력이 안되었으면 true
	}
	return false;//입력이 되었으면 false
}//isNull end -----------------------------
//===========================================
//ID
//===========================================
function isID(obj){
	
	var str=obj.value;
	if(str.length==0){
		alert("ID입력하시요");
		return false;
	}//if
	str=str.toUpperCase();//대문자로 변환 ,A~Z, a~z
	
	//ID 첫글자가 영문자 이어야한다
	if(!('A'<=str.charAt(0) && 'Z'>=str.charAt(0))){ 
		alert("첫글자를 영문자로 입력하시요");
		return false;
	}//if

	for(var i=1; i<str.length; i++){
		if(!(('A'<=str.charAt(i) && str.charAt(i)<='Z') ||
				('0'<=str.charAt(i) && str.charAt(i)<='9') ||
				(str.charAt(i)=='_')))
		{
			alert("영문자,숫자,특수문자 ( _ ) 만 사용할 수 있음");
			return false;
		}//if
	}//for
	return true;
}//isID
//==========================
//Email
//==========================
function isEmail(obj){
	var str=obj.value;
	
	if(str==""){
		return false;
	}//if
	
	var i=str.indexOf("@");
	if(i<0){
		return false;
	}
	
	i=str.indexOf(".");
	if(i<0){
		return false;
	}
	return true;
	
}//isEmail() end
//==========================
//card
//==========================
function isCardNumber(obj){
	var str=obj.value;
	
	if(str.length != 16){
		return false;
	}
	
	for(var i=0; i<str.length; i++){
		if(!('0'<=str.charAt(i) && str.charAt(i)<='9')){
			return false;
		}//if
	}//for
	return true;
}//isCardNumber end

//==========================
//ssn1, ssn2
//==========================
function isSSN(front,back){
	var birthday=front.value;//생년월일 
	var num=back.value;//뒷번호 
	
	if(birthday.length != 6){
		return false;
	}
	if(num.length != 7){
		return false;
	}
	
	var hap=0;//변수 
	
	for(var i=0; i<6; i++){
		var temp=birthday.charAt(i)*(i+2);
		hap+=temp;
	}//for
	
	var n1=num.charAt(0);//*8
	var n2=num.charAt(1);//*9
	var n3=num.charAt(2);//*2
	var n4=num.charAt(3);//*3
	var n5=num.charAt(4);//*4
	var n6=num.charAt(5);//*5
	var n7=num.charAt(6);
	
	hap+=(n1*8)+(n2*9)+(n3*2)+(n4*3)+(n5*4)+(n6*5);
	
	hap %= 11;//나머지 
	hap = 11 - hap;//11- 나머지
	hap %= 10;//11- 나머지 연산값이  2자리일때   
	
	if(hap != n7){//끝자리가 같은지 비교 한다 
		return false;
	}
	return true;
}//isSSN
/*
         외국인 
1 남자    5
2 여자    6

3 남자    7
4 여자    8

881217-1055919
234567 892345

hap %= 11;//나머지
hap = 11-hap;//11-나머지
    11-0==>11
    11-1==>10
    11-2==>9
hap %= 10;

*/

//==========================
//p1, p2 암호 
//==========================
function isSame(ob1,ob2){
	alert("pwd")
	var str1=ob1.value;
	var str2=ob2.value;
	
	if(str1.length==0 || str2.length==0){
		alert("암호를 입력 하시요");
		return false;
	}
	
	if(str1 != str2){
		alert("암호가 일치하지 않습니다");
		return false;
	}
	return true;
}


