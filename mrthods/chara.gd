class_name Chara
extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var cross_with: Cross

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ask: AnimatedSprite2D = $ask

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Ask") and cross_with:
		cross_with.crox()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	ask.visible = cross_with != null
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var nyn = velocity.y > 1000
	if nyn:
		get_tree().change_scene_to_file("res://lvl/lv_nyn.tscn")
	
	if is_on_floor():
		if is_zero_approx(direction):
			animated_sprite_2d.play("idle")
		else:animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
	move_and_slide()
