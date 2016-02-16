// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	$('.js-ing-list').on('click', '.js-add-ing', addIngredient );
	$('.js-sandwich-ing-list').on('click', '.js-delete-ing', deleteSandwichtIngredient );
});

function addIngredient(event) {
	var ingredient_id = $(this).attr('data-id');

	var sandwich_id = $(".js-sandwich-id").attr('data-id');

	var request = $.ajax({
	  	url: `/api/sandwiches/${sandwich_id}/ingredients/add`,
	      	type: 'POST',
	      	data: {id: ingredient_id}
	});

	request.done(function(response) {
		updateMoreIngredientsList(response, ingredient_id);
	});
}

function deleteSandwichtIngredient(event) {
	var ingredient_id = $(this).attr('data-id');

	var sandwich_id = $(".js-sandwich-id").attr('data-id');

	var request = $.ajax({
	  	url: `/api/sandwiches/${sandwich_id}/ingredients/delete`,
	      	type: 'DELETE',
	      	data: {id: ingredient_id}
	});

	request.done(function(response) {
		updateSandwichIngredientsList(response);
	});
}

function updateMoreIngredientsList(response, ingredient_id) {
	$('.js-sandwich-ing-list').empty();

	response.ingredients.forEach(function(i) {
		var li = `
					<li class="js-sandwich-ing" data-id="${i.id}">
						${i.name}
						<button class="js-delete-ing" data-id="${i.id}">
	    					Delete
	  					</button>
					</li>
					`;

		$('.js-sandwich-ing-list').append(li);
	});

	$(`.js-ing[data-id='${ingredient_id}']`).remove();
}

function updateSandwichIngredientsList(response) {
	$(`.js-sandwich-ing[data-id='${response.id}']`).remove();

	var li = `
				<li class="js-ing" data-id="${response.id}">
					${response.name}
					<button class="js-add-ing" data-id="${response.id}">
	    				Add
	  				</button>
				</li>
				`;

	$('.js-ing-list').append(li);
}
