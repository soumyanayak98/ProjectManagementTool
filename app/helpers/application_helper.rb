module ApplicationHelper
  def assigned_users (arr)
    unames = arr.map{ |ele| ele.username }
    first =  unames.slice(0, unames.size - 1).join(", ")
    last = unames.slice(-1)
    return first + " & " +last
  end

  def task_status(task)
    if task.delivered
      "Delivered"
    else
      if task.done
        "Finished"
      else
        task.started ? "Started" : "Not Started"
      end
    end
  end
end
