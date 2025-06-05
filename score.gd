extends RichTextLabel
var score = 0
func _on_firstplayer_playertwokilled():
	score += 2
	print_debug(score)
	text = "%s" % score
