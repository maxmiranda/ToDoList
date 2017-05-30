module Menu
  require List
  choice = "don't quit"
  puts "--------------------------------------------------------"
  puts "Welcome to your personal ToDo Assistant."
  puts "Let's get started by adding a task:"
  task = gets.chomp
  myList = List.new
  myList.add_task(task)
  until choice == quit
    puts "-------------------------------------------------------"
    puts "Which would you like to do?
    add
    complete
    remove
    display
    quit
    "
    choice = gets.chomp
    case choice
    when "add"
      puts "What task do you wanna add?"
      new_task = gets.chomp
      myList.add_task(new_task)
    when "complete"
      puts "Which task are you done with?"
      done_task = gets.chomp
      myList.complete_task(done_task)
    when "remove"
      puts "Which task do you want to delete?"
      deleted_task = gets.chomp
      myList.delete_task(deleted_task)
    when "display"
      myList.display_tasks
    else
      puts "That was not a command."
    end
  end
  puts "Thanks for using me"
end


class List
  include Menu
  attr_accessor :tasks
  def initialize
    @tasks = Hash.new
  end

  def add_task(task)
    if @tasks[task] == nil
      @tasks[task] = "Incomplete"
    else
      puts "That task is already in the list."
    end
    puts " "
  end

  def display_tasks
    if @tasks.length > 0
      @tasks.each{|task, status| puts "#{task}: #{status}"}
    else
      puts "There are no tasks in this list."
    end
    puts " "
  end

  def complete_task(task)
    display_tasks
    if @tasks[task] == "Incomplete"
      @tasks[task] = "Complete"
    elsif @tasks[task] == nil
      puts "That task was not in the list."
    end
    puts " "
  end

  def delete_task(task)
    if @tasks[task] != nil
      @tasks.delete(task)
    else
      puts "This task was not in the list."
    end
    puts " "
  end
end

if __FILE__ == $PROGRAM_NAME
  include Menu
end
