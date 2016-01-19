
require_relative("../lib/task.rb")
require_relative("../lib/todoList.rb")


describe TodoList do
	before :each do
		@todoList = TodoList.new("Javi")
	end

  	describe "#add_task" do
    	it "adds a task" do
        task = Task.new("Walk the dog")
        @todoList.add_task(task)
    		expect(@todoList.tasks.length).to eq(1)
    	end
  	end

  	describe "#delete_task" do
    	it "deletes a task" do
		    task = Task.new("Walk the dog")
      	@todoList.add_task(task)
      	@todoList.delete_task(task.id)
  		  expect(@todoList.tasks.length).to eq(0)
    	end
  	end

  	describe "#find_task_by_id" do
    	it "finds a task by its id" do
        task = Task.new("Walk the dog")
      	@todoList.add_task(task)
      	@todoList.find_task_by_id(task.id)
    		expect(@todoList.find_task_by_id(task.id)).to eq(task)
    	end

    	it "returns nil if it does not find any task" do
        task = Task.new("Walk the dog")
        @todoList.add_task(task)
      	@todoList.find_task_by_id(task.id)
    		expect(@todoList.find_task_by_id(task.id+1)).to eq(nil)
    	end
  	end

    describe "#sort_by_id" do
      it "sorts ascendingly the tasks by their ids" do
        task1 = Task.new("Task1")
        task2 = Task.new("Task2")
        task3 = Task.new("Task3")

        @todoList.add_task(task1)
        @todoList.add_task(task2)
        @todoList.add_task(task3)

        @todoList.sort_by_id("ASC")
        
        expect(@todoList.tasks).to eq([task1, task2, task3])
      end

      it "sorts descendingly the tasks by their ids" do
        task1 = Task.new("Task1")
        task2 = Task.new("Task2")
        task3 = Task.new("Task3")

        @todoList.add_task(task1)
        @todoList.add_task(task2)
        @todoList.add_task(task3)

        @todoList.sort_by_id("DESC")
        
        expect(@todoList.tasks).to eq([task3, task2, task1])
      end
    end

    describe "#sort_by_created" do
      it "sorts ascendingly the tasks by their creation time" do
        task1 = Task.new("Task1")
        task2 = Task.new("Task2")
        task3 = Task.new("Task3")

        @todoList.add_task(task1)
        @todoList.add_task(task2)
        @todoList.add_task(task3)

        @todoList.sort_by_created("ASC")
        
        expect(@todoList.tasks).to eq([task1, task2, task3])
      end

      it "sorts descendingly the tasks by their creation time" do
        task1 = Task.new("Task1")
        task2 = Task.new("Task2")
        task3 = Task.new("Task3")
        
        sorted_todoList = TodoList.new("Javi")
        sorted_todoList.add_task(task3)
        sorted_todoList.add_task(task2)
        sorted_todoList.add_task(task1)

        @todoList.add_task(task1)
        @todoList.add_task(task2)
        @todoList.add_task(task3)

        @todoList.sort_by_created("DESC")
        
        expect(@todoList.tasks).to eq([ task3, task2, task1])
      end
    end
end