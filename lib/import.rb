require 'mongo'
require 'csv'

conn = Mongo::Connection.new
db = conn["planit"]
c = db["skills"]
c.remove

def experience_calculator(form_entry)
  case form_entry
  when "Never been there"
    -1
  when "Short assignment"
    0
  when "1 year in job"
    1
  when "2 years in job"
    2
  when "3+ years in job"
    3
  else
    -1
  end
end

  CSV.open("../imports/p4.tsv", col_sep:"\t", headers:true) do |csv|
      csv.each do |row|
        c.insert(
          _id: row[35],
          role: row[36],
          name: row[37],
          entry_date: DateTime.parse(row[0]).to_time,
          certifications: row[1].nil? ? [] : row[1].split(",").map(&:strip),
          extra_cert: row[9].nil? ? [] : row[9].split(",").map(&:strip),
          test_tools: row[2].nil? ? [] : row[2].split(",").map(&:strip),
          extra_tools: row[10].nil? ? [] : row[10].split(",").map(&:strip),
          automation_level: row[3].to_i,
          mobile_level: row[4].to_i,
          performance_level: row[5].to_i,
          security_level: row[6].to_i,
          sdlc: row[7].nil? ? [] : row[7].split(",").map(&:strip),
          enterprise_tech: row[8].nil? ? [] : row[8].split(",").map(&:strip),
          extra_tech: row[11].nil? ? [] : row[11].split(",").map(&:strip),
          languages: row[12].nil? ? [] : row[12].split(",").map(&:strip),
          extra_languages: row[13].nil? ? [] : row[13].split(",").map(&:strip),
          industry_sectors: {
            finance: experience_calculator(row[14]),
            investment: experience_calculator(row[15]),
            banking: experience_calculator(row[16]),
            insurance: experience_calculator(row[17]),
            water: experience_calculator(row[18]),
            electricity: experience_calculator(row[19]),
            oil: experience_calculator(row[20]),
            gas: experience_calculator(row[21]),
            mining: experience_calculator(row[22]),
            energy: experience_calculator(row[23]),
            telecommunications: experience_calculator(row[24]),
            government: experience_calculator(row[25]),
            gaming: experience_calculator(row[26]),
            logistics: experience_calculator(row[27]),
            health: experience_calculator(row[28]),
            manufactoring: experience_calculator(row[29]),
            retail: experience_calculator(row[30]),
            automobile: experience_calculator(row[31]),
            aerospace: experience_calculator(row[32]),
            commodities: experience_calculator(row[33]),
            sports: experience_calculator(row[34])
          }
        )
    end
  end
