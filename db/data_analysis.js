// import statements
./mongoimport --db planit -c industry --type csv --fields sector --file /sw/apps/planit-g/imports/industry.import

// Number of certifications,tools, tech, lang per employee
db.skills.aggregate(
	[
		{$project: {
			_id:1, 
			certifications: {$size: "$certifications"},
			tools: {$size: "$test_tools"},
			technologies: {$size: "$enterprise_tech"},
			languages: {$size: "$languages"}
		}
	}
	]
);

// Search for a particular entity per employee
t = db.skills.find({languages: {$regex: /gherkin/i }}, {_id:1, role:1});
print(t);
// Search with or clauses
db.skills.find({
	"$or": [
		{languages: {$regex: /guerkin/i }},
		{test_tools: {$regex: /cucumber/i }}
	]}, {_id:1, role:1}
);

// Find employee with experience in specific industry sector

db.skills.find({"industry_sectors.health": {$gt: 0}})

// Extraction of totals in evaluation areas
db.certifications.count()
db.tools.count()
db.technologies.count()
db.languages.count()
db.industry.count()
// Total: 104 Radial Circles

// 