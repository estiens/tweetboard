require 'csv'

Student.delete_all unless Student.count == 0

def seed_from_csv_file(path, label, has_headers = true)
  CSV.read(Rails.root.join(path), headers: has_headers).tap do |csv|
    print "Seeding #{label}: \n"

    csv.each_with_index do |row, i|
      yield row if block_given?

      ratio = (i + 1).to_f / csv.size
      per10  = (ratio * 10).round

      filled = per10 < 2 ? 0 : (per10 - 1)
      unfilled = 10 - per10
      pad_percentage = ("%.2f" % (ratio * 100)).rjust(6)
      progress = "%s%% [%s>%s]" % [ pad_percentage, ("=" * filled), (" " * unfilled) ]

         print "\r#{progress}"
    end
    print "\n"
  end
end

seed_from_csv_file("db/seeds/students.csv", "Student") { |row| Student.create!(twitter_handle: row[0]) }