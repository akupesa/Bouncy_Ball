extends KinematicBody2D
class_name Actor

export var speed: = Vector2(300.0, 1000.0)
export var gravity = 3000.0
export var stomp_impulse = 1000.0

var FLOOR_NORMAL = Vector2.UP
var _velocity: = Vector2.ZERO

func	calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse
	return out


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()