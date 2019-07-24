
$(function() {
	var initUrl = "getoptioninfo";
	var selectUrl = "changepulldowntarget";
	var submitUrl = "getformdata";

	function getInitInfo() {
		$.getJSON(initUrl, function(data) {
			if (data.status) {
				initPullDornTarget(data, 0);
			}
		});
	}
	getInitInfo();

	function initPullDornTarget(data, select) {
		var tempFirHtml = '<option data-id=-10>全部</option>';
		var tempSecHtml = '<option data-id=-10>全部</option>';
		var tempThiHtml = '<option data-id=-10>全部</option>';
		if (select == 0) {
			data.data.firTradeList.map(function(item, index) {
				tempFirHtml += '<option data-id="' + item.firTradeId + '">'
						+ item.firTradeDesc + '</option>';
			});
			data.data.secTradeList.map(function(item, index) {
				tempSecHtml += '<option data-id="' + item.secTradeId + '">'
						+ item.secTradeDesc + '</option>';
			});
			data.data.thiTradeList.map(function(item, index) {
				tempThiHtml += '<option data-id="' + item.thiTradeId + '">'
						+ item.thiTradeDesc + '</option>';
			});

			$('#first-trade').html(tempFirHtml);
			$('#second-trade').html(tempSecHtml);
			$('#third-trade').html(tempThiHtml);
		} else if (select == 1) {
			data.data.secTradeList.map(function(item, index) {
				tempSecHtml += '<option data-id="' + item.secTradeId + '">'
						+ item.secTradeDesc + '</option>';
			});
			data.data.thiTradeList.map(function(item, index) {
				tempThiHtml += '<option data-id="' + item.thiTradeId + '">'
						+ item.thiTradeDesc + '</option>';
			});
			$('#second-trade').html(tempSecHtml);
			$('#third-trade').html(tempThiHtml);
		} else if (select == 2) {
			data.data.thiTradeList.map(function(item, index) {
				tempThiHtml += '<option data-id="' + item.thiTradeId + '">'
						+ item.thiTradeDesc + '</option>';
			});
			$('#third-trade').html(tempThiHtml);
		}

	}

	function getPullDownTarget(firTradeId, secTradeId, thiTradeId, select) {
		// alert(firTradeId);
		// alert(secTradeId);
		// alert(thiTradeId);

		var formData = new FormData();
		formData.append("firTradeId", firTradeId);
		formData.append("secTradeId", secTradeId);
		formData.append("thiTradeId", thiTradeId);
		$.ajax({
			url : selectUrl,
			type : 'POST',
			data : formData,
			contentType : false,
			processData : false,
			cache : false,
			success : function(data) {
				if (data.status) {
					// alert(1);
					initPullDornTarget(data, select);
				} else {
					alert(data.msg);
					alert("error!");
				}
			}
		});
	}

	$('#first-trade').change(function() {
		// alert($(this).children('option:selected').val());
		var firTradeId = $(this).children('option:selected').attr('data-id');
		getPullDownTarget(firTradeId, null, null, 1);
	});
	$('#second-trade').change(
			function() {
				var secTradeId = $(this).children('option:selected').attr(
						'data-id');
				var thiTradeId = $('#third-trade').children('option:selected')
						.attr('data-id');
				getPullDownTarget(null, secTradeId, null, 2);
			});

	// $('.word').children().click(function() {
	// var x = $('input:radio:checked').val();
	//		
	// alert(x);
	// });

	$('#submit')
			.click(
					function() {
						
						brand = {};
						brand.brandFirLetter = $('.word').find(
								'input:radio:checked').val();
						brand.firTradeId = $('#first-trade').children(
								'option:selected').attr('data-id');
						brand.secTradeId = $('#second-trade').children(
								'option:selected').attr('data-id');
						brand.thiTradeId = $('#third-trade').children(
								'option:selected').attr('data-id');
						days = $('.time').find('input:radio:checked').val();
						brand.brandGrade = $('#grade').children(
								'option:selected').text();
						brand.brandType = $('.message').children(
								'option:selected').val();
						brand.brandRunWay = $('.wh')
								.children('option:selected').text();
						brand.brandAuditStatus = $('.state').children(
								'option:selected').val();
						brand.brandChName = $('.name').val();
						adminName = $('.people').val();
						pageIndex = 1;
						pageSize = $('#pageSize').children('option:selected')
								.text();
						console.log("brand.brandFirLetter: "
								+ brand.brandFirLetter);
						console.log("brand.firTradeId: " + brand.firTradeId);
						console.log("brand.secTradeId: " + brand.secTradeId);
						console.log("brand.thiTradeId: " + brand.thiTradeId);
						console.log("days: " + days);
						console.log("brand.brandGrade: " + brand.brandGrade);
						console.log("brand.brandType: " + brand.brandType);
						console.log("brand.brandRunWay: " + brand.brandRunWay);
						console.log("brand.brandAuditStatus: "
								+ brand.brandAuditStatus);
						console.log("brand.brandChName: " + brand.brandChName);
						console.log("adminName: " + adminName);
						console.log("pageIndex: " + pageIndex);
						console.log("pageSize: " + pageSize);
						var formData = new FormData();
						formData.append("brandFirLetter", brand.brandFirLetter);
						formData.append("firTradeId", brand.firTradeId);
						formData.append("secTradeId", brand.secTradeId);
						formData.append("thiTradeId", brand.thiTradeId);
						formData.append("brandGrade", brand.brandGrade);
						formData.append("brandType", brand.brandType);
						formData.append("brandRunWay", brand.brandRunWay);
						formData.append("brandChName", brand.brandChName);
						formData.append("brandChName", brand.brandChName);
						formData.append("brandAuditStatus", brand.brandAuditStatus);
						
						formData.append('days', days);
						formData.append('adminName', adminName);
						formData.append('pageIndex', pageIndex);
						formData.append('pageSize', pageSize);
						$.ajax({
							url : submitUrl,
							type : 'POST',
							data : formData,
							contentType : false,
							processData : false,
							cache : false,
							success : function(data) {
								if (data.status) {
									// 动态生成表
									change(data.data);

								} else {
									alert("error: " + data.message);

								}
							}

						});

					});

	function change(data) {
		var tempHtml = '<tr bgcolor="#034D98" align="center"><th style="width: 80px;"><input type="checkbox" name="All"'
			
			+ 'id="All" value="全选" onClick="funSelAll(this)" /><span class="sp">全选</span></th>'
			+ '<th><span class="sp">一级业态</span></th>' + '<th><span class="sp">二级业态</span></th>' 
			+ '<th><span class="sp">品牌等级</span></th>' + '<th><span class="sp">品牌</span></th>' 
			+ '<th><span class="sp">维护人员</span></th>' + ''
			+ '<th><span class="sp">审核内容类型</span></th>' + '<th><span class="sp">提交时间</span></th>'
			+ '<th><span class="sp">审核状态</span></th>' + '<th><span class="sp">操作</span></th></tr>';

		data.brandList.map(function(item, index) {
			tempHtml += '<tr align="center"><td><input type="checkbox" name="One" id="One" /><span class="sp2">'
				+ (index+1) + '</span></td><td><span class="2">' + item.firTrade.firTradeDesc
				+ '</span></td><td><span class="sp2">' + item.secTrade.secTradeDesc
				+ '</span></td><td><span class="sp2">' + item.brandGrade
				+ '</span></td><td><span class="sp2">' + item.brandChName
				+ '</span></td><td><span class="sp2">' + item.brandMaintain.administrator
				+ '</span></td><td><span class="sp2">' + item.brandType
				+ '</span></td><td><span class="sp2">' + item.createTime
				+ '</span></td><td><span class="sp2">' + item.brandAuditStatus
				+ '</span></td><td><span class="sp2">' 
				+ '<a style="color: #034D98;">查看</a> <a style="color: #034D98;"> 通过</a><a style="color: #034D98;"> 拒绝</a></span></td>'
				+ '</td>';
		});
		$('.table').html(tempHtml);
				
	}

})
