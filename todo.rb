module Menu
  def cycle
    puts "-------------------------------------------------------
    Which would you like to do? (Pick a number)
    1) add
    2) complete
    3) remove
    4) display
    5) write to file
    6) read from file
    7) quit
    "
    gets.chomp
  end
end

class List
  attr_accessor :tasks
  def initialize
    @tasks = Hash.new
  end

  def big_s(hash)
    string = ""
    hash.each do |item, description|
      string += "#{item}: #{description}" + "\n"
    end
    return string
  end

  def write
    if @tasks.length > 0
      return big_s(@tasks)
    else
      puts "There are no tasks in this list."
    end
    puts " "
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

def write_to_file(file)
  open(file, 'w') {|f| f.puts display_tasks}
end

if __FILE__ == $PROGRAM_NAME
  include Menu

    puts "--------------------------------------------------------"
    puts "Welcome to your personal ToDo Assistant."
    puts "Let's get started by adding a task:"
    task = gets.chomp
    myList = List.new
    myList.add_task(task)

  choice = cycle
  until choice == "7"
    case choice
    when "1"
      puts "What task do you wanna add?"
      new_task = gets.chomp
      myList.add_task(new_task)
    when "2"
      puts "Which task are you done with?"
      done_task = gets.chomp
      myList.complete_task(done_task)
    when "3"
      puts "Which task do you want to delete?"
      deleted_task = gets.chomp
      myList.delete_task(deleted_task)
    when "4"
      myList.display_tasks
    when "5"
      puts "What is the name of the file?"
      file = gets.chomp
      open(file, 'w') {|f| f.write(myList.write)}
    when "6"
      puts "What file would you like to read from?"
      file= gets.chomp
      puts File.read(file)

    else
      puts "That was not a command."
      choice = cycle
    end
    choice = cycle
  end
  puts "Thanks for using me"
end
