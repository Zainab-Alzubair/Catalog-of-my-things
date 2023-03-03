require 'json'

module ListLabel
  def add_label(label)
    File.new('./classes/storage/labels.json', 'w+') unless File.exist?('./classes/storage/labels.json')
    if File.empty?('./classes/storage/labels.json')
      labels = []
    else
      data = File.read('./classes/storage/labels.json').split
      labels = JSON.parse(data.join)
    end

    labels << ({ id: label.id, title: label.title, color: label.color })

    json_data = JSON.pretty_generate(labels)
    File.write(File.join('classes/storage', 'labels.json'), json_data)
  end

  def list_labels
    File.new('./classes/storage/labels.json', 'w+') unless File.exist?('./classes/storage/labels.json')

    if File.empty?('./classes/storage/labels.json')
      puts "\n"
      puts 'The labels list is empty, please add some items with labels...'
    else
      data = File.read('./classes/storage/labels.json').split
      labels = JSON.parse(data.join)
      puts "👤 label's list:\n\n"
      labels.each_with_index do |label, index|
        print "#{index}) First name: #{label['title']}, Last name: #{label['color']} \n\n"
      end
    end
  end
end
