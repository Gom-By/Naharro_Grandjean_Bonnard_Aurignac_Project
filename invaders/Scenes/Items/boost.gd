class_name Boost
extends Area2D

@export var potency: float

var buff_increase: float = 1.0
var base: float = 1.0
var player: Player = null 

func _ready() -> void:
	test_exist()
	connect("body_entered", _on_body_entered)
	$Timer.connect("timeout", _on_timer_timeout)

func _on_body_entered(body: Node2D) -> void:
	$Timer.start()
	if(body.is_in_group("player")):
		var p := (body as Player)
		stat_increased(p, potency)
		self.hide()
		$CollisionShape2D.set_deferred("disabled", true)

# what stats the buff will increase
# make sure in it, buff_increase is assigned to stats.current - stats.before_buff
func stat_increased(_p: Player, _potency: float):  
	pass

# when the buff stop
# make sure stats.current = buff_increase. Combined with the above, it will remove the buff
func _on_timer_timeout():
	pass
	
func test_exist():
	if(OS.is_debug_build()):
		assert($Timer) # test during debug mode
