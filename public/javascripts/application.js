jQuery.fn.submitWithAjax = function() {
	this.submit(function(){
		$.post(this.action, $(this).serialize(), null, "script");
		return false;
	})
	return this;
};

$(".ajax").submitWithAjax();