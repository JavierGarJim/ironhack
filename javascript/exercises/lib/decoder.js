
function decoder(words) {
	var index = 0;
	var secretMessage = "";

	words.forEach(function(word) {
		secretMessage += word[index];
		index = (index + 1) % 5;
	});

	return secretMessage;
}

module.exports = {
	decoder: decoder
};