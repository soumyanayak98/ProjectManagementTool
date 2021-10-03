module ApplicationHelper
  def assigned_users (arr)
    unames = arr.map(&:username)
    if arr.size >= 2
      first =  unames.slice(0, unames.size - 1).join(", ")
      last = unames.slice(-1)
      return first + " & " +last
    else
      return unames[0]
    end
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
