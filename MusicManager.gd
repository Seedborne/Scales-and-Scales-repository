extends Node

@onready var audio_stream_player = $BackgroundMusic


func play_music(stream):
	audio_stream_player.stream = stream
	audio_stream_player.play()

func stop_music():
	audio_stream_player.stop()


