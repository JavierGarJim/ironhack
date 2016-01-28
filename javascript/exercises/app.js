
var Decoder = require('./lib/decoder.js');

var words, words2, message, message2;

words = [
	"dead",
	"bygone",
	"landing",
	"cheaply",
	"assumed",
	"incorrectly",
	"attention",
	"agent"
];

words2 = [
	"January",
	"lacks",
	"caveats",
	"hazardous",
	"DOORS",
	"crying",
	"arrogantly",
	"climate",
	"proponent",
	"rebuttal"
];


message = Decoder.decoder(words);

console.log(message);

message2 = Decoder.decoder(words2);

console.log(message2);