
function blastOff(timeout) {
	(function countdown() {
		console.log(timeout);
		
		if (timeout) {
			timeout--;
			setTimeout(countdown, 1000);
		}
		else {
			console.log("Blast off!");
		}
	})();
}

blastOff(5);