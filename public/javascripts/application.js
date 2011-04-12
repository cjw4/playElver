$(document).ready(function(){
	$(".holeInput").val("3");
	$(".totalInput").val("54");
	
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
	});
});
