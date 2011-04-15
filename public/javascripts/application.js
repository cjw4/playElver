$(document).ready(function(){
	$(".holeInput").val("3");
	$(".totalInput").val("54");
	
	// give #scorecard a sc attriubute value of "true" (sc = "true")
	$("#scorecard").attr("sc", "true");
	
	// load the results partial via ajax
	$("#results").load("partials/results");
	
	$(".holeInput").keyup(function() {
		var i = 1;
		var total = 0;
		for (i = 1; i <= 18; i++) {

			var holeInput = $("#scorecard_hole"+i);
			var holeInputValue = holeInput.val();
			holeInputValue = parseInt(holeInputValue);

			if (holeInputValue > 3) holeInput.css("color", "blue");
			else if (holeInputValue == 3) holeInput.css("color", "black");
			else holeInput.css("color", "green");

			if (!isNaN(holeInputValue)) {		
				total = total + holeInputValue;
				score = total - 54;

				if (score > 0) score = "+" + score;
				else if (score == 0) score = "E";
				else score = score;
			}
		}
		$("#scorecard_total").val(total);
	});
	
	$(".outputSC").css({"display":"none"});
	
	$(".showBtn").live("click", function(){
		$(this).parent().parent().children(".outputSC").slideToggle();
		if ($(this).val() == "<") {
			$(this).replaceWith($("<input>", {"type":"button", "value":"v", "class":"showBtn"}));
		} else {
			$(this).replaceWith($("<input>", {"type":"button", "value":"<", "class":"showBtn"}));
		}
		
	});
	
	$("#toggleSC").live("click", function(){
		var scorecard = $("#scorecard");
		scorecard.animate({
			left: parseInt(scorecard.css('left'), 10) == 0 ?
			-scorecard.outerWidth() + 55 : 0
		});
		$(this).animate({
			left: parseInt(scorecard.css('left'), 10) == 0 ?
			-scorecard.outerWidth() + 55 : 0
		})
		if ($(this).attr("value") == "<"){
			$(this).attr({value:">"});
			$(".totalInput").attr({readonly:""})
		} else {
			$(this).attr("value", "<");
			$(".totalInput").attr({readonly:"readonly"})
		}
		
		// ajax toggle button 
		if (scorecard.attr("sc") == "true") {
			scorecard.attr("sc", "false");
		} else {
			scorecard.attr("sc", "true");
		}
		
	});
	
	$("#new_scorecard").submit(function() {
		$("img.loader").css({display:'inline'});
		var hole1 = $("#scorecard_hole1").val();
		var hole2 = $("#scorecard_hole2").val();
		var hole3 = $("#scorecard_hole3").val();
		var hole4 = $("#scorecard_hole4").val();
		var hole5 = $("#scorecard_hole5").val();
		var hole6 = $("#scorecard_hole6").val();
		var hole7 = $("#scorecard_hole7").val();
		var hole8 = $("#scorecard_hole8").val();
		var hole9 = $("#scorecard_hole9").val();
		var hole10 = $("#scorecard_hole10").val();
		var hole11 = $("#scorecard_hole11").val();
		var hole12 = $("#scorecard_hole12").val();
		var hole13 = $("#scorecard_hole13").val();
		var hole14 = $("#scorecard_hole14").val();
		var hole15 = $("#scorecard_hole15").val();
		var hole16 = $("#scorecard_hole16").val();
		var hole17 = $("#scorecard_hole17").val();
		var hole18 = $("#scorecard_hole18").val();
		var total = $("#scorecard_total").val();
		var month = $("#scorecard_month").val();
		var tees = $("#scorecard_pro");
		var pro;
		if (tees.attr("checked") == true) pro = "true";
		else pro = "false";
		
		var largeSC = $("#scorecard").attr("sc");
		$.post('scorecards', 
			{ hole1: hole1, hole2: hole2, hole3: hole3, hole4: hole4, hole5: hole5, hole6: hole6,
		  	hole7: hole7, hole8: hole8, hole9: hole9, hole10: hole10, hole11: hole11, hole12: hole12,
   	      	hole13: hole13, hole14: hole14, hole15: hole15, hole16: hole16, hole17: hole17, hole18: hole18,
		  	total: total, month: month, large_scorecard: largeSC, pro: pro }, 
			function() {
				$("img.loader").css({display:'none'});
				$("#results").load("partials/results");				
			});
			
		return false;
	});
	

});
