function saveCanvas(element, slug) {
	var canvas = document.getElementById(element);
	var img    = canvas.toDataURL("image/png");
	//	  document.write(\'<img src="\'+img+\'"/>\');

	var canvasData = canvas.toDataURL("image/png");

	// uncomment this to commit the png to disk
	$.ajax({
		contentType: 'application/x-www-form-urlencoded',
		url: '/musictheory/scales/canvas_save.php',
		data: {
			'data': canvasData,
			'slug': slug
		},
		'type':'post'
	});
}

jQuery(document).ready(function($){
	$('.player').on('click', function(){
		var chords = $(this).data('midi');
		var velocity = 127; // how hard the note hits
		MIDI.setVolume(0, 127);
		var d = 1;
		for (var c in chords) {
			for (var p in chords[c]) {
				MIDI.noteOn(0, chords[c][p], velocity, d);
				MIDI.noteOff(0, chords[c][p], d + 0.4);
			}
			d = d + 0.5;
		}
	});
});

