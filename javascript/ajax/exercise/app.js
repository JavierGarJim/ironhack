
$(document).on("ready", function(){
	$(".js-submit").on("click", submit);

	$(".js-show-characters").on("click", function() {
		fetchChracters();
	});
});

function submit (event) {
	event.preventDefault();
	
  	console.debug('SUBMITTED');

  	var newCharacter = {
    	name: $('.name').val(),
    	occupation: $('.occupation').val(),
    	weapon: $('.weapon').val()
  	}

	$.ajax({
		type: "POST",

		url: "https://ironhack-characters.herokuapp.com/characters",

		data: newCharacter,

		success: function() {
			var html = `
				<li>
					<h2>${newCharacter.name}</h2>
					<p>${newCharacter.id}</p>
					<p>Occupation: ${newCharacter.occupation}</p>
					<p>Weapon: ${newCharacter.weapon}</p>
				</li>
			`;

			$(".js-characters-list").append(html);

			alert("New character added successfully.");
		},

		error: function() {
			alert("Could not add new character.");
		}
	});
}

function fetchChracters() {
	$.ajax({
		url: "https://ironhack-characters.herokuapp.com/characters",

		success: function(response) {
			console.log("Everything went okay.");

			displayCharacters(response);
		},

		error: function() {
			console.log("We screwed up!");
		}
	});
}

function displayCharacters(characters) {
	characters.forEach(function(char) {
		var html = `
			<li>
				<h2>${char.name}</h2>
				<p>${char.id}</p>
				<p>Occupation: ${char.occupation}</p>
				<p>Weapon: ${char.weapon}</p>
			</li>
		`;

		$(".js-characters-list").append(html);
	});
}
