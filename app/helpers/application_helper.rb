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
end
