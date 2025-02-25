/*
* Copyright 2022 Team We-Art
* Licensed under MIT (https://github.com/projext9/WeArt-Project)
*/
var optionValue = "";
var pieceValue = "";
	
var optionSelect = (target) => {
	optionValue = target.options[target.selectedIndex].value;
}
var pieceSelect = (target) => {
	pieceValue = target.options[target.selectedIndex].value;
}

function modal1() { //비로그인
	$('#modal1').modal('show');
};
function modal2() { //장바구니 담기 성공
	$('#modal2').modal('show');
};
		
$(function(){ //장바구니 담기
	$("#additemcart").click(function(){
		$.ajax({
			type: "post",
			url: "itemcartadd.do",
			data: {
				"optionValue": $("#optionValue option:selected").val(),
				"pieceValue": $("#pieceValue option:selected").val()
			},
			success: function(data){
				if(data == "L") {
					modal1();
				} else if (data == "Y") {
					modal2();
				} else {
					alert("서버 에러!");
				}
			},
			error: function(error){ alert("서버 에러!"); }
		});
	});
});

$(function(){ //바로구매
	$("#additemcart2").click(function(){
		$.ajax({
			type: "post",
			url: "itemcartadd.do",
			data: {
				"optionValue": $("#optionValue option:selected").val(),
				"pieceValue": $("#pieceValue option:selected").val()
			},
			success: function(data){
				if(data == "L") {
					modal1();
				} else if (data == "Y") {
					location.href = "itemcart.do";
				} else {
					alert("서버 에러!");
				}
			},
			error: function(error){ alert("서버 에러!"); }
		});
	});
});

function fn_search() { //검색
	var fm = document.frm;
	var itemCode = document.getElementById("itemCode").value;
	if (itemCode == 1) {
		fm.action = "1.do";
		fm.method = "get";
		fm.submit();
	} else if (itemCode == 2) {
		fm.action = "2.do";
		fm.method = "get";
		fm.submit();
	} else if (itemCode == 3) {
		fm.action = "fishingshop.do";
		fm.method = "get";
		fm.submit();
	} else if (itemCode == 4) {
		fm.action = "3.do";
		fm.method = "get";
		fm.submit();
	} else if (itemCode == 5) {
			fm.action = "4.do";
			fm.method = "get";
			fm.submit();
	} else {
		alert("에러가 발생했습니다.");
	}
}