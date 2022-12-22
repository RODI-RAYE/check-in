$(function() {
	
	$(".home").on("change", function() {
		var code = $(this).val();
		const table = $(this).parent().parent();
		
		console.log(code);
		
		if(code != "") {
			$.ajax("/home/compare/" + code, {
				method: "GET",
				contentType: "application/json",
				dataType: "json",
				success: result => {
					var item = result;
					const {build,vacancy,meter,floor,move,contract,deposit,month,cost,manage,trans1,trans2,trans3,good,bad,option,safe,light,way,wind,water,drip,heat,sound,mold,trash1,trash2,trash3,etc,memo} = item;
					
					for(let str in item){
						if(str == null){
							str = "";
						}
					}
					
					let html = `<table class="table"><tr><td>준공연월</td><td>${build}</td><td>공실기간</td><td>${vacancy}</td></tr>`;
					html += `<tr><td>평수</td><td>${meter}</td><td>층수</td><td>${floor}</td></tr>`;
					html += `<tr><td>입주가능일</td><td>${move}</td><td>계약기간</td><td>${contract}</td></tr>`;
					html += `<tr><td>전세/보증금</td><td>${deposit}</td><td>월세</td><td>${month}</td></tr>`;
					html += `<tr><td>관리비</td><td colspan="3">${cost}</td></tr>`;
					html += `<tr><td>관리비 포함</td><td colspan="3">${manage}</td></tr>`;
					html += `<tr><td>근처 교통편</td><td colspan="3">지하철역: ${trans1}, 버스정류장: ${trans2}, 통근시간: ${trans3}</td></tr>`;
					html += `<tr><td>편의시설</td><td colspan="3">${good}</td></tr>`;
					html += `<tr><td>악성시설</td><td colspan="3">${bad}</td></tr>`;
					html += `<tr><td>옵션</td><td colspan="3">${option}</td></tr>`;
					html += `<tr><td>보안</td><td colspan="3">${safe}</td></tr>`;
					html += `<tr><td>채광</td><td colspan="3">${light}</td></tr>`;
					html += `<tr><td>방향</td><td colspan="3">${way}</td></tr>`;
					html += `<tr><td>통풍</td><td colspan="3">${wind}</td></tr>`;
					html += `<tr><td>수압</td><td colspan="3">${water}</td></tr>`;
					html += `<tr><td>물빠짐</td><td colspan="3">${drip}</td></tr>`;
					html += `<tr><td>난방/온수</td><td colspan="3">${heat}</td></tr>`;
					html += `<tr><td>단열/방음</td><td colspan="3">${sound}</td></tr>`;
					html += `<tr><td>곰팡이/해충</td><td colspan="3">${mold}</td></tr>`;
					html += `<tr><td>쓰레기</td><td colspan="3">종량제: ${trash1}, 분리수거: ${trash2}, 음식물: ${trash3}</td></tr>`;
					html += `<tr><td>기타</td><td colspan="3">${etc}</td></tr>`;
					html += `<tr><td>특이사항</td><td colspan="3">${memo}</td></tr></table>`;

					table.children(".table").remove();
					table.append(html);

					console.log(item);
				},
				error: xhr => alert(`오류 발생 : ${xhr.statusText}`)
			}) // ajax END
		}
	});
});