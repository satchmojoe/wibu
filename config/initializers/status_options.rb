module StatusOptions
  def self.defined
    "defined"
  end

  def self.in_progress
    "in_progress"
  end

  def self.completed
    "completed"
  end

  def self.all
    [self.defined, self.in_progress, self.completed]
  end
end
