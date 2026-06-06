extends Node2D

@export var width := 0
@export var height := 0

var grid  = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	randomNumbers()
	
	printGrid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Up"):
		moveUp()
		printGrid()
	
	if Input.is_action_just_pressed("Down"):
		moveDown()
		printGrid()
	
	if Input.is_action_just_pressed("Left"):
		moveLeft()
		printGrid()
		
	if Input.is_action_just_pressed("Right"):
		moveRight()
		printGrid()
	

func printGrid():
	print()
	for i in grid:
		print(i)
		

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
				
				#if moves > 0 : #if you moved 
					#grid[i - moves][j] = grid[i][j]
					#grid[i][j] = 0
					#print(moves)
				if i - (moves + 1) > 0:
					if grid[i - (moves + 1)][j] = grid[i][j]:
						
					
				
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
	randomNumbers()
