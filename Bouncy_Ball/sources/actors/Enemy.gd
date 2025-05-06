extends KinematicBody2D
class_name	Enemy

onready var RayCast2DLeft: RayCast2D = get_node("RayCast/RayCast2DLeft")
onready var RayCast2DRight: RayCast2D = get_node("RayCast/RayCast2DRight")
onready var RayCast2DGroundLeft: RayCast2D = get_node("RayCast/RayCast2DGroundLeft")
onready var RayCast2DGroundRight: RayCast2D = get_node("RayCast/RayCast2DGroundRight")

export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0

var FLOOR_NORMAL = Vector2.UP
var _velocity: = Vector2.ZERO


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x


func _on_StompDetector_body_entered(body):
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	is_blocked()
	is_on_edge()
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func is_blocked():
	if RayCast2DLeft.is_colliding() and not RayCast2DRight.is_colliding():
		_velocity.x = 300
	if RayCast2DRight.is_colliding() and not RayCast2DLeft.is_colliding():
		_velocity.x = -300


func is_on_edge():
	if not RayCast2DGroundLeft.is_colliding() and RayCast2DGroundRight.is_colliding():
		_velocity.x = 300
	if not RayCast2DGroundRight.is_colliding() and RayCast2DGroundLeft.is_colliding():
		_velocity.x = -300