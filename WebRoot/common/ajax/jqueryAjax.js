function  ajaxRequest(action) {
	var myResult;
	$.ajax({
				url : action,
				cache : false,
				async : false,
				type : "POST",
				success : function(result) {
					myResult=result;
				},
				error : function() {
					myResult='提交请求失败!';					
				}
			});
	return myResult;
}