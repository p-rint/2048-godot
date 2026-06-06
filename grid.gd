extends Node2D

@export var width := 0
@export var height := 0

var grid  = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]

@onready var Tiles: Node2D = $Tiles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	randomNumbers()
	
	printGrid()
	updateGrid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Up"):
		moveUp()
		updateGrid()
	
	if Input.is_action_just_pressed("Down"):
		moveDown()
		updateGrid()
	
	if Input.is_action_just_pressed("Left"):
		moveLeft()
		updateGrid()
		
	if Input.is_action_just_pressed("Right"):
		moveRight()
		updateGrid()
	

func printGrid():
	print()
	for i in grid:
		print(i)

func updateGrid():
	var i = 0
	for node2d : Node2D in Tiles.get_children():
		
		var j = 0
		for tile : ColorRect in node2d.get_children():
		
			var label : Label = tile.get_child(0)
			label.text = str(grid[i][j])
			j += 1
		i += 1

func randomNumbers():
	var count = 2
	
	while count > 0:
		var x = randi_range(0,3)
		var y = randi_range(0,3)
		if grid[x][y] == 0:
			grid[x][y] = 2
			count -= 1
	
	

func moveUp():
	#for i in range(grid.size() - 1, -1, -1):
	for i in range(grid.size()):
		for j in range(grid[i].size()):
			
			if grid[i][j] != 0:
				var moves = 0 #the amt of times it moves
				
				while i - moves > 0 :
					if grid[i - (moves + 1)][j] == 0:
						#print("Mv!")
						moves += 1
					else: 
						break
				
				if moves > 0 : #if you moved 
					grid[i - moves][j] = grid[i][j]
					grid[i][j] = 0
					print(moves)
				
				if grid[i - (moves + 1)][j] == grid[i - moves][j]:
					grid[i - (moves + 1)][j] = grid[i - moves][j] * 2
					grid[i - moves][j] = 0
				
	randomNumbers()

func moveDown():
	for i in range(grid.size() - 1, -1, -1):
		for j in range(grid[i].size()):
			
			if grid[i][j] != 0:
				var moves = 0 #the amt of times it moves
				
				while i + moves < grid.size() - 1 :
					if grid[i + (moves + 1)][j] == 0:
						#print("Mv!")
						moves += 1
					else: 
						break
				
				if moves > 0 : #if you moved 
					grid[i + moves][j] = grid[i][j]
					grid[i][j] = 0
					print(moves)
				
				if i + (moves + 1) < 4:
					if grid[i + (moves + 1)][j] == grid[i + moves][j]:
						grid[i + (moves + 1)][j] = grid[i + moves][j] * 2
						grid[i + moves][j] = 0
				
	randomNumbers()

func moveLeft():
	for i in range(grid.size()):
		for j in range(grid[i].size()):
			
			if grid[i][j] != 0:
				var moves = 0 #the amt of times it moves
				
				while j - moves > 0 :
					if grid[i][j  - (moves + 1)] == 0:
						moves += 1
					else: 
						break
				
				if moves > 0 : #if you moved 
					grid[i][j - moves] = grid[i][j]
					grid[i][j] = 0
					print(moves)
				
				if grid[i][j - (moves + 1)] == grid[i][j - moves]:
							grid[i][j - (moves + 1)] = grid[i][j - moves] * 2
							grid[i][j - moves] = 0
				
	randomNumbers()

func moveRight():
	for i in range(grid.size()):
		for j in range(grid.size() - 1, -1, -1):
			
			if grid[i][j] != 0:
				var moves = 0 #the amt of times it moves
				
				while j + moves < grid[i].size() - 1 :
					if grid[i][j + (moves + 1)] == 0:
						#print("Mv!")
						moves += 1
					else: 
						break
				
				if moves > 0 : #if you moved 
					grid[i][j + moves] = grid[i][j]
					grid[i][j] = 0
					print(moves)
				
				if j + (moves + 1) < 4:
					if grid[i][j + (moves + 1)] == grid[i][j + moves]:
							grid[i][j + (moves + 1)] = grid[i][j + moves] * 2
							grid[i][j + moves] = 0
	randomNumbers()
