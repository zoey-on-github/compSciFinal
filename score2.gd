extends RichTextLabel
var score = 0
func _on_secondplayer_playeronekilled():
	score += 1
	print_debug(score)
	text = "%s" % score