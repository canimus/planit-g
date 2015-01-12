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