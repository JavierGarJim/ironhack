

$('.ctrl-tournaments.actn-index').on('click', '[data-hook~=tourney-show]', showTournament );

function showTournament(event) {
	event.preventDefault();

	var form = this.nextElementSibling;

	var tournamentId = this.value;

	var request = $.ajax({
	  	url: '/api/players',
	});

	request.done(showForm(form));
}

function showForm(form) {
	var show_button = $(form).prev();

	if ($(show_button).text() === 'SHOW') {
		$(show_button).text("HIDE")
	} else {
		$(show_button).text("SHOW")
	}
	
	$(form).toggleClass("hide");
	// console.log($(form));
}