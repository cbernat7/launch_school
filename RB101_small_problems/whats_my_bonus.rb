#takes 2 arguments
#positive integer and a boolean
#calculates the bonus for a given salary
#if true, the bonus should be half the salary
#if false, bonus is 0

#Input integer, and boolean
#If: true
  #return integer * .5
#If; false
  #return 0
#return integer

def calculate_bonus(salary, bonus)
  if bonus
    salary / 2
  else
    0
  end
end


#given solution using ternary operator
def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end