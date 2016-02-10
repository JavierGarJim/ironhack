// Write your Pizza Builder JavaScript in this file.

$(".btn-pepperonni").on('click', function() {
	$(".pep").toggle();
	$(".btn-pepperonni").toggleClass("active");

	if ($(".btn-pepperonni").hasClass("active") == false) {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt - 1;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".pep-text").hide();
	}
	else {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt + 1;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".pep-text").show();
	}
})

$(".btn-green-peppers").on('click', function() {
	$(".green-pepper").toggle();
	$(".btn-green-peppers").toggleClass("active");

	if ($(".btn-green-peppers").hasClass("active") == false) {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt - 1;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".pepper-text").hide();
	}
	else {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt + 1;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".pepper-text").show();
	}
})

$(".btn-mushrooms").on('click', function() {
	$(".mushroom").toggle();
	$(".btn-mushrooms").toggleClass("active");

	if ($(".btn-mushrooms").hasClass("active") == false) {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt - 1;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".mushroom-text").hide();
	}
	else {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt + 1;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".mushroom-text").show();
	}
})

$(".btn-crust").on("click", function() {
	$(".crust").toggleClass("crust-gluten-free");
	$(".btn-crust").toggleClass("active");

	if ($(".btn-crust").hasClass("active") == false) {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt - 5;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".crust-text").hide();
	}
	else {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt + 5;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".crust-text").show();
	}
})

$(".btn-sauce").on("click", function() {
	$(".sauce").toggleClass("sauce-white");
	$(".btn-sauce").toggleClass("active");

	if ($(".btn-sauce").hasClass("active") == false) {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt - 3;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".sauce-text").hide();
	}
	else {
		var value = $("strong").text();
		var valueWithoutDollarSign = value.slice(1)
		var valueToInt = parseInt(valueWithoutDollarSign);
		var newValue = valueToInt + 3;
		var newValueToStr = newValue.toString();
		
		$("strong").text("$" + newValueToStr);

		$(".sauce-text").show();
	}
})