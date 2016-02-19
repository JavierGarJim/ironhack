

$('.ctrl-tournaments.actn-index').on('click', '[data-hook~=tourney-delete]', deleteTournament );

function deleteTournament(event) {
	event.preventDefault();

	var tournament = this.parentElement;

	var tournamentId = this.value;

	var request = $.ajax({
	  	url: '/api/tournaments',
	      	type: 'DELETE',
	      	data: {id: tournamentId}
	});

	request.done(removeTournament(tournament));
	// hace lo mismo que:
	// removeTournament(tournament);
}

function removeTournament(tournament) {
	$(tournament).remove();
}

