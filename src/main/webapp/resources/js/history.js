$(function() {
	
	autosize($(".memo"));
	
	$(".home").on("change", function() {
		var code = $(this).val();
		
		console.log(code);
		
		if(code != null) {
			$.ajax("/history/image/" + code, {
				method: "POST",
				contentType: "application/json",
				dataType: "json",
				data : code,
				success: result => {
					const item = result;
					const {images} = item;
					
					console.log(images[0].num);
					
					$("#num").val(`${images[0].num}`);
					
					document.getElementById('image').src = `/upload/${images[0].uuid+`_`+images[0].filename}`;
				},
				error: xhr => alert(`오류 발생 : ${xhr.statusText}`)
			}) // ajax END
		}
	});
});