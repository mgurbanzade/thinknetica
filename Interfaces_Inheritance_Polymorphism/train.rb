class Train
  attr_reader :type, :number, :wagons, :speed, :route

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
  end

  def accelerate(amount)
    self.speed += amount if amount > 0
  end

  def decelerate(amount)
    self.speed -= amount if amount <= speed && amount > 0
  end

  def attach_wagon(wagon)
    wagons << wagon if speed == 0 && wagon.type == type
  end

  def detach_wagon
    wagons.pop if speed == 0 && wagons.count > 0
  end

  def set_route(route)
    @route = route
    @station_index = 0
    current_station.train_arrival(self)
  end

  def current_station
    route.stations[@station_index]
  end

  def move_next_station
    return unless route
    if current_station != route.stations.last
      current_station.train_departure(self)
      @station_index += 1
      current_station.train_arrival(self)
    end
  end

  def move_previous_station
    return unless route
    if current_station != route.stations.first
      current_station.train_departure(self)
      @station_index -= 1
      current_station.train_arrival(self)
    end
  end

  def previous_station
    return unless route
    @station_index != 0 ? route.stations[@station_index - 1] : false
  end

  def next_station
    return unless route
    route.stations[@station_index + 1]
  end
end
