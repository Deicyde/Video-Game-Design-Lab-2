extends Node2D

@export var x_velocity = 0
@export var y_velocity = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func bounce():
	var top_left = position
	var width = $Sprite.texture.get_width() * $Sprite.scale.x
	var height = $Sprite.texture.get_height() * $Sprite.scale.y
	var bottom_right = Vector2(position.x + width, position.y + height)
	var screen_size = get_viewport().get_visible_rect().size
	
	if top_left.x <= 0:
		position.x = 0
		x_velocity = -x_velocity
	if top_left.y <= 0:
		position.y = 0
		y_velocity = -y_velocity
	if bottom_right.x >= screen_size.x:
		position.x = screen_size.x - width
		x_velocity = -x_velocity
	if bottom_right.y >= screen_size.y:
		position.y = screen_size.y - height
		y_velocity = -y_velocity


func _input(event):
	if event is InputEventMouseButton:
		var add_velocity: Vector2 = event.position - position
		add_velocity = add_velocity.normalized() * 50
		x_velocity = x_velocity + add_velocity.x
		y_velocity = y_velocity + add_velocity.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = position.x + x_velocity * delta
	position.y = position.y + y_velocity * delta
	
	bounce()
	pass
