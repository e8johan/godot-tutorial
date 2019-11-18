extends KinematicBody2D

export (int) var speed = 240
export (int) var jump_speed = -320
export (int) var gravity = 600

var velocity = Vector2.ZERO

func get_input() -> int:
    var res : int = 0
    velocity.x = 0
    if Input.is_action_pressed("ui_right"):
        velocity.x += speed
        res = 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= speed
        res = -1
    return res

func _physics_process(delta):
    var dir := get_input()

    if dir > 0:
        $Sprite.flip_h = false
        $Sprite.play("walk")
    elif dir < 0:
        $Sprite.play("walk")
        $Sprite.flip_h = true
    else:
        $Sprite.play("idle")

    velocity.y += gravity * delta
    velocity = move_and_slide(velocity, Vector2.UP)
    if is_on_floor():
        if Input.is_action_just_pressed("jump"):
            velocity.y = jump_speed
    else:
        $Sprite.play("jump")