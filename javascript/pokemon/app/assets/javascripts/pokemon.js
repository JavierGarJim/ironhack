// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

PokemonApp.Pokemon = function(pokemonUri) {
	this.id = PokemonApp.Pokemon.idFromUri(pokemonUri);
};

PokemonApp.Pokemon.prototype.render = function() {
	console.log("Rendering pokemon: #" + this.id);

	this.getPokemonInfo();
};

PokemonApp.Pokemon.idFromUri = function(pokemonUri) {
	var uriSegments = pokemonUri.split("/");
	var secondLast = uriSegments.length - 2;
	
	return uriSegments[secondLast];
};

PokemonApp.Pokemon.prototype.getPokemonInfo = function() {
	var self = this;

	$.ajax({
		url: "/api/pokemon/" + self.id,

		success: function(response) {
			self.info = response;

			console.log("Pokemon info:");
			console.log(self.info);

			self.getPokemonImg();

			$(".js-pokemon-name").text(self.info.name);
			$(".js-pokemon-number").text(self.info.pkdx_id);
			$(".js-pokemon-height").text(self.info.height);
			$(".js-pokemon-weight").text(self.info.weight);

			$(".js-pokemon-hp").text(self.info.hp);
			$(".js-pokemon-attack").text(self.info.attack);
			$(".js-pokemon-defense").text(self.info.defense);
			$(".js-pokemon-sp-atk").text(self.info.sp_atk);
			$(".js-pokemon-sp-def").text(self.info.sp_def);
			$(".js-pokemon-speed").text(self.info.speed);

			self.info.types.forEach(function(type) {
				$(".js-pokemon-types").after(`<dd>${type.name}</dd>`);
			});
		},

		error: function() {
			alert("ERROR!");
		}
	});
};

PokemonApp.Pokemon.prototype.getPokemonImg = function() {
	var self = this;

	$.ajax({
		url: "/api/sprite/" + self.id,

		success: function(response) {
			self.sprite = response;

			console.log("Sprite info:");
			console.log(self.sprite);

			$(".js-sprite").prop("src", "http://pokeapi.co" + self.sprite.image);

			self.showPokemonModal();
		},

		error: function() {
			alert("ERROR!");
		}
	});
};

PokemonApp.Pokemon.prototype.showPokemonModal = function() {
	$(".js-pokemon-modal").modal("show");
};

$(document).on("ready", function() {
	$(".js-show-pokemon").on("click", function(event) {
		var $button = $(event.currentTarget);
		var pokemonUri = $button.data("pokemon-uri");

		var pokemon = new PokemonApp.Pokemon(pokemonUri);
		pokemon.render();
	});
});