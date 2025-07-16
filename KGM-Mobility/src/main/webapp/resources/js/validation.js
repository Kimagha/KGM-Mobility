function CheckAddCar() {
	var carId=document.getElementById("carId");
	var name=document.getElementById("name");
	var unitPrice=document.getElementById("unitPrice");
	var releaseDate=document.getElementById("releaseDate");
	var engine=document.getElementById("engine");
	var CarImage=document.getElementById("CarImage");
/*	var unitsInStock=document.getElementById("unitsInStock");
	var description=document.getElementById("description");*/
	
	if (!check(/^CAR[0-9]{3,11}$/, carId, "[자동차 코드]\nCAR과 숫자를 조합하여 4~12자까지 입력하세요\n첫 글자는 반드시 CAR로 시작하세요"))
		return false;
		
	if (name.value.length < 2 || name.value.length > 50){
		alert("[차량명]\n최소 2자에서 최대 50자까지 입력하세요");
		name.focus();
		return false;
	}
	
	if (unitPrice.value.length==0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.focus();
		return false;
	}
	
	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		unitPrice.focus();
		return false;
	}
	
	if (releaseDate.value.length === 0 || isNaN(releaseDate.value)) {
		alert("[출고일]\n숫자만 입력하세요");
		releaseDate.focus();
		return false;
	}
	
	if (!/^[가-힣\s]+$/.test(engine.value.trim())) {
		alert("[엔진]\n한글만 입력해주세요");
		engine.focus();
		return false;
	}
	

	if (!CarImage.value) {
		alert("[이미지]\n이미지를 선택해주세요");
		CarImage.focus();
		return false;
	}
	
/*	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.focus();
		return false;
	}*/
	
/*	if (description.value.length < 100) {
		alert("[상세설명]\n최소 100자 이상 입력하세요");
		description.focus();
		return false;
	}*/
	
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
	
	document.newCar.submit()
}