#! ruby -EUTF-8
# -*- mode:ruby; coding:utf-8 -*-

class GraphicsLoader

  def initialize
    @textFile = nil
    @chankCounter = 0
    @driverName = nil
    @talkState = 0
    @wordArray = []
    @clusterWordArray = []
    @clusterCharactorName = []
  end

  def TextCreator(charactorNumber, state)
    case charactorNumber
    when 1 then
      @driverName = 'axtlinder'
    when 2 then
      @driverName = 'nazl'
    when 3 then
      @driverName = 'parspled'
    when 4 then
      @driverName = 'sicrom'
    when 5 then
      @driverName = 'victorea'
    else
      @driverName = 'axtlinder'
    end

    if state == 0
      @talkState = 'start'
    else
      @talkState = 'win'
    end

    counter = 0
    File.open('./TextFile/' + @driverName + '_' + @talkState + '.txt') do |file|
      file.each_line do |stringLine|
        @clusterWordArray[counter] = stringLine.split(':')
        counter += 1
      end
    end

    return @clusterWordArray

  rescue SystemCallError => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
  rescue IOError => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
  end

  def CharactorNameLoader
    counter = 0
    File.open('./TextFile/charactorNameFile.txt') do |file|
      file.each_line do |stringLine|
        @clusterCharactorName[counter] = stringLine.split(':')
        counter += 1
      end
    end

    return @clusterCharactorName

  rescue SystemCallError => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
  rescue IOError => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
  end

end
