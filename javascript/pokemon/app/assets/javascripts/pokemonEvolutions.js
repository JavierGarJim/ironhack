
PokemonApp.PokemonEvolutions = function(id, info) {
	this.id = id;
	this.info = info;
};

PokemonApp.PokemonEvolutions.prototype.render = function() {
	console.log("Rendering evolutions for: #" + this.id);

	var self = this;

	$.ajax({
		url: "/api/pokemon/" + this.id,

		success: function(response) {

		},

		error: function() {
			alert("ERROR!!");
		}
	});
};

// $(document).on("ready", function() {
// 	$(".js-show-pokemon").on("click", function(event) {
// 		var $button = $(event.currentTarget);
// 		var pokemonUri = $button.data("pokemon-uri");

// 		var pokemon = new PokemonApp.Pokemon(pokemonUri);
// 		pokemon.render();
// 	});
// });