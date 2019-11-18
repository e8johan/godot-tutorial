extends KinematicBody

var velocity : Vector3 = Vector3.ZERO

const SPEED = 10
const GRAVITY = 10
const JUMP = 8

func _physics_process(delta):
    
    velocity.y -= GRAVITY * delta
    
    if Input.is_action_pressed("forward"):
        velocity.z = -SPEED
    elif Input.is_action_pressed("back"):
        velocity.z = SPEED
    else:
        velocity.z = 0
    
    if Input.is_action_pressed("left"):
        velocity.x = -SPEED
    elif Input.is_action_pressed("right"):
        velocity.x = SPEED
    else:
        velocity.x = 0
    
    velocity = move_and_slide(velocity, Vector3.UP)
    
    if is_on_floor():
        if Input.is_action_just_pressed("jump"):
            velocity.y = JUMP