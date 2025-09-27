extends RichTextLabel

var default_text = "CURRENT SCORE: "

func _process(delta):
	var text = str(default_text, GameState.level)
	self.text = (text)
