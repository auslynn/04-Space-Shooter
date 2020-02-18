extends RigidBody2D

onready var Player = get_node("/root/Game/Player")
export var speed = 500


func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.get_parent().name == "Enemies":
			Player.change_score(c.score)
		queue_free()
		
	if position.y < -10:
		queue_free()

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,-speed))
	state.set_angular_velocity(0)
