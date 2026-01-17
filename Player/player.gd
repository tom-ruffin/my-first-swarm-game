extends CharacterBody2D


var movement_speed = 40.0

func _physics_process(_delta):
	movement()


func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	#up is the negative value, down positive value, counter intuitive
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up") 
	
	#puts the x_mov values and y_mov values as coordinates of a vector
	#ex: x_mov=1-0 = 0, y_move=0-0 = 0
	#mov=(1,0)
	var mov = Vector2(x_mov,y_mov)
	
	#velocity = vector * movespeed
	#ex : (1,0) * 40 = (40,0)
	#normalize to avoid moving quicker in diagonal speed
	velocity = mov.normalized()*movement_speed
	move_and_slide()
